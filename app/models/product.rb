class Product < ApplicationRecord
  attachment :image
  enum product_status: { soldout: 0, sale: 1}
  belongs_to :genre
  has_many :cart_items
end
