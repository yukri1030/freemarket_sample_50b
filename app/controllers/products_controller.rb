class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  before_action :authenticate_user!, except: [:show, :search_products]

  def new
    @product = Product.new
    @product.product_images.build
    render layout: 'application-off-header-footer.html.haml'
  end

  def create
     if brand = Brand.find_by(name: params[:product][:brand_id])
        params[:product][:brand_id] = brand.iproduct
      else
         params[:product][:brand_id] = Brand.create(name: params[:product][:brand_id])
      end

      @product = Product.new(product_params)
      if new_image_params[:images][0] != " " && @product.save
        new_image_params[:images].each do |image|
          @product.product_images.create(image_url: image, product_id: @product_id)
        end
      Deal.create(seller_id: current_user.id , product_id: @product.id, position_id:1)
      
      flash[:notice] = '出品が完了しました'
      redirect_to root_path
      else
        @product.product_images.build
        flas[:alert] = '未入力項目あります'
        redirect_back(fallback_location: root_path)  
      end         
    end

  def show
    render layout: 'application-off-header-footer.html.haml'
  end

  def edit
    render layout: 'application-off-header-footer.html.haml'
  end



  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :text, :category_id, :size_id, :brand_id, :status, :shipping_fee_payer, :delivery_method, :delivery_from_area, :delivery_time, :price)
  end

  def registered_image_params
    params.require(:registered_images_ids).permit({ids: []})
  end

  def new_image_params
    params.require(:new_images).permit({images: []})
  end

end