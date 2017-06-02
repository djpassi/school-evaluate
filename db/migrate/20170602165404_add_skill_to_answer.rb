class AddSkillToAnswer < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :skill, :string
  end
end
