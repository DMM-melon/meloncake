class Product < ApplicationRecord
  attachment :image

  has_many :cart_items
  has_many :order_itmes

  enum product_status: [:販売中, :売り切れ]

  belongs_to :genre

  ## validates :quantity, uniqueness: true

end
