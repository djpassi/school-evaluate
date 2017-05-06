class CreateContains < ActiveRecord::Migration[5.0]
  def change
    create_table :contains do |t|
      t.references :survey_schema, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
