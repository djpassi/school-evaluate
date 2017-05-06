require 'test_helper'

class SurveySchemasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_schema = survey_schemas(:one)
  end

  test "should get index" do
    get survey_schemas_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_schema_url
    assert_response :success
  end

  test "should create survey_schema" do
    assert_difference('SurveySchema.count') do
      post survey_schemas_url, params: { survey_schema: { title: @survey_schema.title } }
    end

    assert_redirected_to survey_schema_url(SurveySchema.last)
  end

  test "should show survey_schema" do
    get survey_schema_url(@survey_schema)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_schema_url(@survey_schema)
    assert_response :success
  end

  test "should update survey_schema" do
    patch survey_schema_url(@survey_schema), params: { survey_schema: { title: @survey_schema.title } }
    assert_redirected_to survey_schema_url(@survey_schema)
  end

  test "should destroy survey_schema" do
    assert_difference('SurveySchema.count', -1) do
      delete survey_schema_url(@survey_schema)
    end

    assert_redirected_to survey_schemas_url
  end
end
