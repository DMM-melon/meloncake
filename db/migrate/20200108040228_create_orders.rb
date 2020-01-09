class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :payment,default: 0, null: false, limit: 1
      t.integer :total_price
      t.integer :order_status
      t.string :name
      t.string :postcode
      t.string :address
      t.integer :postage
      t.timestamps
    end
  end
end
