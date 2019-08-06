class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images
  has_one :deal, dependent: :destroy
  belongs_to_active_hash :size
  belongs_to_active_hash :brand
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee_payer
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

end
