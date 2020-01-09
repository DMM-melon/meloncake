class Order < ApplicationRecord
	enum payment:{クレジットカード: 0,銀行振込: 1 }
	#credit=クレジットカード, transfer=銀行振込
end
