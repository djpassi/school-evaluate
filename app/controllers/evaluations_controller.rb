class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :set_categories, only: [:index, :show_evaluation, :show_stadistics, :new, :edit, :update]
  skip_before_filter :verify_authenticity_token

  def evaluate
    authorize Evaluation
    @surveys = SurveySchema.all
    @evaluations = Array.new

  end

  def show_evaluation
    authorize Evaluation
    @evaluation = Evaluation.find(params[:id])
    @scores = @evaluation.get_score
    @question_category = [@evaluation.answers.where(category: 0), @evaluation.answers.where(category: 1), @evaluation.answers.where(category: 2)]
    @text = @evaluation.answers.where(name: "Comentarios extras")
    #@score = @evaluation.get_score
  end
  def show_stadistics
    @evaluation = Evaluation.find(params[:id])
    @scores = @evaluation.get_score
    p 'hola'
    p @scores
    @question_category = [@evaluation.answers.where(category: 0), @evaluation.answers.where(category: 1), @evaluation.answers.where(category: 2)]
    p @question_category
  end

  # GET /evaluations
  # GET /evaluations.json
  def index
    authorize Evaluation

  end

  def index_evaluations
    authorize Evaluation
    evaluations = Evaluation.all
    if params[:sort] == "Profesor"
      @evaluations = evaluations.sort {
        |first, second|
        boolean_value = first.user.name.downcase <=> second.user.name.downcase
        boolean_value  # <--- this line has been added
      }
    elsif params[:sort] == "Fecha"
      @evaluations =  evaluations.sort{|x| x.created_at}
    elsif params[:sort] == "Ciclo"
      @evaluations = evaluations.sort {
        |first, second|
        boolean_value = first.survey_schema.cycle <=> second.survey_schema.cycle
        boolean_value  # <--- this line has been added
      }
    elsif params[:sort] == "Pauta"
      @evaluations = evaluations.sort {
        |first, second|
        boolean_value = first.survey_schema.title.downcase <=> second.survey_schema.title.downcase
        boolean_value  # <--- this line has been added
      }
    else
      @evaluations = evaluations
    end
  end

  def user_evaluations
    evaluations = Evaluation.where(user_id:current_user.id)
    if params[:sort] == "Profesor"
      @evaluations = evaluations.sort {
        |first, second|
        boolean_value = first.user.name.downcase <=> second.user.name.downcase
        boolean_value  # <--- this line has been added
      }
    elsif params[:sort] == "Fecha"
      @evaluations =  evaluations.sort{|x| x.created_at}
    elsif params[:sort] == "Ciclo"
      @evaluations = evaluations.sort {
        |first, second|
        boolean_value = first.survey_schema.cycle <=> second.survey_schema.cycle
        boolean_value  # <--- this line has been added
      }
    elsif params[:sort] == "Pauta"
      @evaluations = evaluations.sort {
        |first, second|
        boolean_value = first.survey_schema.title.downcase <=> second.survey_schema.title.downcase
        boolean_value  # <--- this line has been added
      }
    else
      @evaluations = evaluations
    end
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
    authorize Evaluation

  end

  # GET /evaluations/new
  def new
    authorize Evaluation
    @evaluation = Evaluation.new
    @survey = SurveySchema.find(params[:survey_id])
    @user_id = params[:user_id]
    @text = @survey.questions.where(name: "Comentarios extras")
    @question_category = [@survey.questions.where(category: 0), @survey.questions.where(category: 1), @survey.questions.where(category: 2)]

  end

  # GET /evaluations/1/edit
  def edit
    authorize Evaluation
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    authorize Evaluation
    answers = params[:answers]
    answers_array = Array.new

    answers.each do |question_id|
      answers_array << Answer.create(name: params[:names][question_id],
                      genre: params[:genres][question_id],
                      text: params[:answers][question_id],
                      skill: params[:skills][question_id],
                      category: params[:categories][question_id])

    end
    evaluation = Evaluation.create(user_id:params[:other_params][:user_id].to_i, survey_schema_id:params[:other_params][:survey_id].to_i)
    evaluation.answers << answers_array

    redirect_to show_evaluation_path(evaluation.id), notice: 'Evaluation was successfully created.'

  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end
    def set_categories
      #@categories = ['INICIO', 'DESARROLLO', 'CIERRE']
      @categories = {0 => 'INICIO', 1 => 'DESARROLLO', 2 => 'CIERRE'}
      @skills = ['Liderazgo', 'Comunicación', 'Responsabilidad', 'Autoridad']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:user_id, :answer_id, :survey_schema_id)
    end
end
