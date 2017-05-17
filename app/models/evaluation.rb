class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  belongs_to :survey_schema
end
