class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :introduction
      t.integer :price
      t.string :image_id
      t.integer :product_status

      t.timestamps
    end
  end
end
