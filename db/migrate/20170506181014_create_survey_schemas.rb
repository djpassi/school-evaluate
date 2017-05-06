class CreateSurveySchemas < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_schemas do |t|
      t.string :title

      t.timestamps
    end
  end
end
