class Delivery < ApplicationRecord
	belongs_to :customer, optional: true
	validates :name, :postcode, :address, presence: true

	def full_address
		"〒" + postcode + " " + address + " " + name
	end

end
