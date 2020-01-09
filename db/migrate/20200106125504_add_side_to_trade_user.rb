class AddSideToTradeUser < ActiveRecord::Migration[5.2]
  def change
    add_column :trade_users, :side, :integer
  end
end
