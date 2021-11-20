class ChangeInformationsToInformation < ActiveRecord::Migration[5.2]
  def change
    rename_table :informations, :information
  end
end
