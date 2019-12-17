class AddCommentToBuyPost < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_posts, :comment, :text
    change_column :buy_posts, :comment, :text, null: false
  end
end
