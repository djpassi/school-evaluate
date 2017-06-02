class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  skip_before_filter :verify_authenticity_token

  def evaluate
    authorize Evaluation
    @surveys = SurveySchema.all
    @evaluations = Array.new

    Evaluation.pluck(:evaluation_number).uniq.each do |x|
      @evaluations << Evaluation.find_by(evaluation_number:x)
    end
  end

  def show_evaluation
    authorize Evaluation
    @evaluation = Evaluation.where(evaluation_number: params[:id])
    #@score = @evaluation.get_score
  end

  # GET /evaluations
  # GET /evaluations.json
  def index
    authorize Evaluation
    @evaluations = Evaluation.all
  end

  def index_evaluations
    authorize Evaluation
    @evaluations = Array.new
    Evaluation.pluck(:evaluation_number).uniq.each do |x|
      @evaluations << Evaluation.find_by(evaluation_number:x)
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
                      text: params[:answers][question_id])

    end
    p 'hola'
    evaluation = Evaluation.create(user_id: params[:other_params][:user_id].to_i,
                      survey_schema_id:params[:other_params][:survey_id].to_i)
    p evaluation

    evaluation.answers << answers_array

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:user_id, :answer_id, :survey_schema_id)
    end
end
