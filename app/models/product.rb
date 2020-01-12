class Product < ApplicationRecord
  attachment :image
  enum product_status: [:soldout, :sale]
  belongs_to :genre

end
