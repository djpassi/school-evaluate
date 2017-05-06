class AddGenreToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :genre, :string
  end
end
