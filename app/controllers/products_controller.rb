class ProductsController < ApplicationController
  def index
  end

  def edit
    render layout: 'application-off-header-footer.html.haml'
  end

  def show
    render layout: 'application-off-header-footer.html.haml'
  end
end
