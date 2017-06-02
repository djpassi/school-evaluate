class AddCategoryToAnswer < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :category, :integer
  end
end
