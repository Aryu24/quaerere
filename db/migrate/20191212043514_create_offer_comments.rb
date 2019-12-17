class CreateOfferComments < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_comments do |t|
      t.integer :offer_id, null: false
      t.integer :user_id, null: false
      t.string  :comment, null: false

      t.timestamps
    end
  end
end
