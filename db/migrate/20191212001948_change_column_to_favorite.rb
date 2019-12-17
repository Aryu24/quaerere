class ChangeColumnToFavorite < ActiveRecord::Migration[5.2]
  def up
  	change_column :favorites, :user_id, :integer, null: false
  	change_column :favorites, :buy_post_id, :integer, null: false
  end

  def down
  	change_column :favorites, :user_id, :integer, null: true
  	change_column :favorites, :buy_post_id, :integer, null: true
  end
end
