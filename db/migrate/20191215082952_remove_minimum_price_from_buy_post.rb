class RemoveMinimumPriceFromBuyPost < ActiveRecord::Migration[5.2]
  def change
  	remove_column :buy_posts, :minimum_price
  end
end
