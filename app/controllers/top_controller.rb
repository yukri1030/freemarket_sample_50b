class TopController < ApplicationController
  def index
    @ladies_products = Product.pickup_category_products(1)
    @mens_products = Product.pickup_category_products(2)
    @baby_kids_products = Product.pickup_category_products(3)
    @beauty_products = Product.pickup_category_products(7)
    @chanel_products = Product.pickup_brand_products("シャネル")
    @vuitton_products = Product.pickup_brand_products("ルイ ヴィトン")
    @supreme_products = Product.pickup_brand_products("シュプリーム")
    @nike_products = Product.pickup_brand_products("ナイキ")
  end
end
