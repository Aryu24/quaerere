class ChangeSideToTradeUser < ActiveRecord::Migration[5.2]
  def up
  	change_column :trade_users, :side, :integer, null: false
  end

  def down
  	change_column :trade_users, :side, :integer, null: true
  end
end
