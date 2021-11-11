class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
