class TopController < ApplicationController

    def index
      @product = Product.find
    end
  
  end

