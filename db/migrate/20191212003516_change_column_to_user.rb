class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
  	change_column :users, :address_building, :string, null: true
  end

  def down
  	change_column :users, :address_building, :string, null: false
  end
end
