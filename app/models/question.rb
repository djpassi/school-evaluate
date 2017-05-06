class Question < ApplicationRecord
  has_many :contains
  has_many :survey_schemas, through: :contains
end
