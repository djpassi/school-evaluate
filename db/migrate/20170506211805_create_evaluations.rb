class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true
      t.references :survey_schema, foreign_key: true

      t.timestamps
    end
  end
end
