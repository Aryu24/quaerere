class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.integer :buy_post_id, null: false
      t.integer :user_id, null: false
      t.string  :title
      t.integer :price, null: false
      t.string  :image_id, null: false
      t.integer :condition, null: false
      t.string  :comment, null: false
      t.boolean :public, null: false

      t.timestamps
    end
  end
end
