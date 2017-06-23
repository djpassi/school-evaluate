class AddEvaluationToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :evaluation, foreign_key: true
  end
end
