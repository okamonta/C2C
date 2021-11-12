class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :genre_id, :integer
    add_column :users, :status_id, :integer
    add_column :users, :full_name, :string
    add_column :users, :nick_name, :string
    add_column :users, :icon, :string
    add_column :users, :message, :string
    add_column :users, :active, :boolean
    add_column :users, :account, :integer
  end
end
