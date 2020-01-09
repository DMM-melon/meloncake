class Product < ApplicationRecord
  attachment :image
  enum genre:{
  	"__":0,
  	売り切れ:1,販売中:1
  }
end
