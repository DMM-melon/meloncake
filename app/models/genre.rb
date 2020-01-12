class Genre < ApplicationRecord

	enum genre_status:{有効: 0,無効: 1}

	has_many :products

end