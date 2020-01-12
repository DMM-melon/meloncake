class Product < ApplicationRecord
  attachment :image

  has_many :cart_items
  enum product_status: [:soldout, :sale]
  belongs_to :genre

end
