class RemoveFieldTypeFromQuestions < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :type, :string
  end
end
