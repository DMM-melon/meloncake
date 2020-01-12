class Order < ApplicationRecord

	enum payment:{クレジットカード: 0,銀行振込: 1 }

	belongs_to :customer
	has_many :order_items

end
