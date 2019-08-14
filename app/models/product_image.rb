class ProductImage < ApplicationRecord
  mount_uploader  :image_url, ImagesUploader

  belongs_to  :product
end
