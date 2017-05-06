class SurveySchema < ApplicationRecord
  has_many :contains
  has_many :questions, through: :contains
end
