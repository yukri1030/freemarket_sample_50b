class ShippingFeePayer < ActiveHash::Base
  field :shipping_fee_payer
  create id: 0, shipping_fee_payer: '---'
  create id: 1, shipping_fee_payer: '送料込み(出品者負担)'
  create id: 2, shipping_fee_payer: '着払い(購入者負担)'

  # has_many :product
end
