class Product < ApplicationRecord
  attachment :image

  has_many :cart_items
  has_many :order_itmes
  enum product_status: [:soldout, :sale]
  belongs_to :genre

end
