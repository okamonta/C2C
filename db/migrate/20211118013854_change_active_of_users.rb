class ChangeActiveOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :active, :boolean, default: 'true'
  end
  def down
    change_column :users, :active, :boolean
  end
end
