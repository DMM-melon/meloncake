class Product < ApplicationRecord
  attachment :image

  has_many :cart_items
  has_many :order_itmes

  enum product_status: [:販売中, :売り切れ]

  validates :name, :image, :introduction, :price, presence: true

  belongs_to :genre

  def self.search(search)
      if search
        Product.where(['name LIKE ?', "%#{search}%"])
      else
        Product.all
      end
  end

  ## validates :quantity, uniqueness: true

end
