class AddEvaluationNumberToEvaluations < ActiveRecord::Migration[5.0]
  def change
    add_column :evaluations, :evaluation_number, :integer
  end
end
