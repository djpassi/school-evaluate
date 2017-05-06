class Contain < ApplicationRecord
  belongs_to :survey_schema
  belongs_to :question
end
