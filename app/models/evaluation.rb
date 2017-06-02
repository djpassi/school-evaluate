class Evaluation < ApplicationRecord
  belongs_to :user
  has_many :answers
  belongs_to :survey_schema
end
