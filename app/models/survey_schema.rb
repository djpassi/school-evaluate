class SurveySchema < ApplicationRecord
  has_many :contains
  has_many :questions, through: :contains

  before_destroy :destroy_contains

  private

  def destroy_contains
    Contain.where(survey_schema_id: id).destroy_all
  end

end
