class OrderItem < ApplicationRecord

	enum order_item_status:{着手不可: 0,製作待ち: 1, 製作中: 2, 製作完了: 3}

	belongs_to :order
	belongs_to :product

	def total_price
		purchase_price * quantity
	end
end
