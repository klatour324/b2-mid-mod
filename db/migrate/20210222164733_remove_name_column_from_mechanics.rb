class RemoveNameColumnFromMechanics < ActiveRecord::Migration[5.2]
  def change
    remove_column :mechanics, :name
  end
end
