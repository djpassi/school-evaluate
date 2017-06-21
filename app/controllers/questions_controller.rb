class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :new, :edit, :update]
  before_action :confirm_logged_in


  # GET /questions
  # GET /questions.json
  def index
    authorize Question
    #@questions = Question.all
    @questions_category = [Question.where(category: 0), Question.where(category: 1), Question.where(category: 2)]
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    authorize Question
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    authorize Question
    @question = Question.new(question_params)
    @question.genre = "score"

    respond_to do |format|
      if @question.save
        format.html { redirect_to new_question_path, notice: 'Pregunta creada' }
        format.json { render :index, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    authorize Question
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to edit_question_path(@question.id), notice: 'Pregunta actualizada' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    authorize Question
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_categories
      #@categories = ['INICIO', 'DESARROLLO', 'CIERRE']
      @categories = {0 => 'INICIO', 1 => 'DESARROLLO', 2 => 'CIERRE'}
      @skills = ['Liderazgo', 'Comunicación', 'Responsabilidad', 'Autoridad']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:name, :category, :skill)
    end
end
