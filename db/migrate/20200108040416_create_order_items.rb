class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :purchase_price
      t.integer :order_item_status

      t.timestamps
    end
  end
end
