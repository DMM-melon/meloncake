class Genre < ApplicationRecord

	enum genre_status:{有効: 0,無効: 1}
	validates :variety, presence: true
	has_many :products

end