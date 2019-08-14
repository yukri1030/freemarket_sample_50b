class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:show, :search_products]

  def show
    render layout: 'application-off-header-footer.html.haml'
  end

  def new
    @product = Product.new
    @product.product_images.build
    render layout: 'application-off-header-footer.html.haml'
  end

  def edit
    render layout: 'application-off-header-footer.html.haml'
  end

  def search_category
    category = Category.find(params[:parent_id])
    if params[:parent_id].to_i >= 159
      @children = category.sizes
    else
      @children = category.children
    end
   respond_to do |format|
     format.html
     format.json
   end
  end

   private
   def set_product
    @product = Product.find(params[:id])
   end

   def product_params
    params.require(:product).permit(:name, :text, :category_id, :size_id, :brand_id, :status, :shipping_feee_payer, :delivery_method, :delivery_from_area, :delivery_time, :price)
   end

   def registered_image_params
    params.require(:registered_images_ids).permit({ids: []})
   end

   def new_image_params
    params.require(:new_images).permit({images: []})
   end

  end
