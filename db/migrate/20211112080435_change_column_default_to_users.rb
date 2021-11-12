class ChangeColumnDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :active, from: nil, to: "0"
  end
end
