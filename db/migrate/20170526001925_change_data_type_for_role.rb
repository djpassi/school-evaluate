class ChangeDataTypeForRole < ActiveRecord::Migration[5.0]

  def self.up
    change_table :users do |t|
      t.change :role, 'integer USING CAST(role AS integer)'
    end
  end

  def self.down
    change_table :users do |t|
      t.change :role, :string
    end
  end

end
