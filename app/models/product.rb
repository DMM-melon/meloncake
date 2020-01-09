class Product < ApplicationRecord
  attachment :image
  enum product_status: { soldout: 0, sale: 1}
  # ジャンルidカラム必要 アソシエーション関係がうまくいってなかったbelongs_to :genre
end
