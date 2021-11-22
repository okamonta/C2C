class RemoveIconFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :icon, :string
  end
end
