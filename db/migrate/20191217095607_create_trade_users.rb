class CreateTradeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_users do |t|
      t.integer :trade_id, null: false
      t.integer :user_id, null: false
      t.boolean :finish_status, default: false, null: false

      t.timestamps
    end
  end
end
