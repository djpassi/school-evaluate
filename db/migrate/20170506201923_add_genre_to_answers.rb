class AddGenreToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :genre, :string
  end
end
