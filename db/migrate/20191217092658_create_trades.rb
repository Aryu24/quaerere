class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :offer_id, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end

    add_index :trades, :offer_id, unique: true
  end
end
