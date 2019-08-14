module TopHelper
  def first_product_image(product)
    product_image = product.product_images.first.image_url
  end
end