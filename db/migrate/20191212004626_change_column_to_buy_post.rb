class ChangeColumnToBuyPost < ActiveRecord::Migration[5.2]

  def up
  	change_column :buy_posts, :user_id, :integer, null: false
  	change_column :buy_posts, :title, :string, null: false
  	change_column :buy_posts, :category, :string, null: false
  	change_column :buy_posts, :brand, :string, null: false
  	change_column :buy_posts, :maximum_price, :integer, null: false
  	change_column :buy_posts, :minimum_price, :integer, null: false
  	change_column :buy_posts, :condition, :integer, null: false
  end

  def down
  	change_column :buy_posts, :user_id, :integer, null: true
  	change_column :buy_posts, :title, :string, null: true
  	change_column :buy_posts, :category, :string, null: true
  	change_column :buy_posts, :brand, :string, null: true
  	change_column :buy_posts, :maximum_price, :integer, null: true
  	change_column :buy_posts, :minimum_price, :integer, null: true
  	change_column :buy_posts, :condition, :integer, null: true
  end
end
