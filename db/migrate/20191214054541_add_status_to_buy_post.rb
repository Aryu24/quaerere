class AddStatusToBuyPost < ActiveRecord::Migration[5.2]
  def change
  	add_column :buy_posts, :status, :boolean
  	change_column :buy_posts, :status, :boolean, null: false, default: true
  end
end
