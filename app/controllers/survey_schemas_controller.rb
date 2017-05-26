class SurveySchemasController < ApplicationController
  before_action :set_survey_schema, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in

  # GET /survey_schemas
  # GET /survey_schemas.json
  def index
    @survey_schemas = SurveySchema.all
  end

  # GET /survey_schemas/1
  # GET /survey_schemas/1.json
  def show
  end

  # GET /survey_schemas/new
  def new
    @survey_schema = SurveySchema.new
    @questions = Question.all
  end

  # GET /survey_schemas/1/edit
  def edit
    @survey_schema = SurveySchema.find_by(id: params[:id])

    @all_questions_id = Question.pluck(:id)
    @questions_id = @survey_schema.questions.pluck(:id)
    @other_questions_id = @all_questions_id - @questions_id

    @other_questions = Question.where(id:@other_questions_id)
  end

  # POST /survey_schemas
  # POST /survey_schemas.json
  def create
    @survey_schema = SurveySchema.new(survey_schema_params)
    @questions = Question.where(id: params[:questions])

    @survey_schema.questions << @questions

    p @survey_schema.questions

    respond_to do |format|
      if @survey_schema.save
        format.html { redirect_to @survey_schema, notice: 'Survey schema was successfully created.' }
        format.json { render :show, status: :created, location: @survey_schema }
      else
        format.html { render :new }
        format.json { render json: @survey_schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_schemas/1
  # PATCH/PUT /survey_schemas/1.json
  def update
    @survey_schema.questions.delete(Question.where(id:params[:delete_questions]))

    @add_questions = Question.where(id: params[:add_questions])

    @survey_schema.questions << @add_questions


    respond_to do |format|
      if @survey_schema.update(survey_schema_params)
        format.html { redirect_to @survey_schema, notice: 'Survey schema was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_schema }
      else
        format.html { render :edit }
        format.json { render json: @survey_schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_schemas/1
  # DELETE /survey_schemas/1.json
  def destroy
    @survey_schema.destroy
    respond_to do |format|
      format.html { redirect_to survey_schemas_url, notice: 'Survey schema was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_schema
      @survey_schema = SurveySchema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_schema_params
      params.require(:survey_schema).permit(:title)
    end
end
