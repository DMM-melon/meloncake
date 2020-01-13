class Delivery < ApplicationRecord
	belongs_to :customer, optional: true

	def full_address
		"〒" + postcode + " " + address + " " + name
	end

end
