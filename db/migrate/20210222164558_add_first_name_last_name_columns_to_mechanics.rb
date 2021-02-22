class AddFirstNameLastNameColumnsToMechanics < ActiveRecord::Migration[5.2]
  def change
    add_column :mechanics, :first_name, :string
    add_column :mechanics, :last_name, :string
  end
end
