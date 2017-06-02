class AddCycleToSurveySchemas < ActiveRecord::Migration[5.0]
  def change
    add_column :survey_schemas, :cycle, :string
  end
end
