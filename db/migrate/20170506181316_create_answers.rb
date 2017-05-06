class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :name
      t.string :type
      t.string :text
      t.integer :score

      t.timestamps
    end
  end
end
