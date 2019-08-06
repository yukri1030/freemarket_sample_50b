class ProductsController < ApplicationController
  def edit
    render layout: 'application-off-header-footer.html.haml'
  end

  def show
    render layout: 'application-off-header-footer.html.haml'
  end

  def new
    @product = Product.new
    @product.product_images.build
    render layout: 'application-off-header-footer.html.haml'
  end
end
