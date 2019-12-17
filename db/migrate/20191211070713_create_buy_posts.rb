class CreateBuyPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_posts do |t|
    	t.integer  :user_id
    	t.string   :title
    	t.string   :image_id
    	t.string   :category
    	t.string   :brand
    	t.integer  :maximum_price
    	t.integer  :minimum_price
    	t.integer  :condition

      t.timestamps
    end
  end
end
