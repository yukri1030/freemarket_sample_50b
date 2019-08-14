require 'rails_helper'

describe TopController do

  describe "GET#index" do

    # @ladies_productsのテスト
    it "assigns the requested ladies_products to @ladies_products" do
      ladies_products = create_list(:product, 4, category_id: 12)
      get :index
      expect(assigns(:ladies_products)).to match(ladies_products)
    end

    # @mens_productsのテスト
    it "assigns the requested mens_products to @mens_products" do
      mens_products = create_list(:product, 4, category_id: 13)
      get :index
      expect(assigns(:mens_products)).to match(mens_products)
    end

    # @baby_kids_productsのテスト
    it "assigns the requested baby_kids_products to @baby_kids_products" do
      baby_kids_products = create_list(:product, 4, category_id: 14)
      get :index
      expect(assigns(:baby_kids_products)).to match(baby_kids_products)
    end

    # @beauty_productsのテスト
    it "assigns the requested beauty_products to @beauty_products" do
      beauty_products = create_list(:product, 4, category_id: 15)
      get :index
      expect(assigns(:beauty_products)).to match(beauty_products)
    end

    # @chanel_productsのテスト
    it "assigns the requested chanel_products to @chanel_products" do
      chanel_products = create_list(:product, 4, brand_id: 1 )
      get :index
      expect(assigns(:chanel_products)).to match(chanel_products)
    end

    # @vuitton_productsのテスト
    it "assigns the requested vuitton_products to @vuitton_products" do
      vuitton_products = create_list(:product, 4, brand_id: 2 )
      get :index
      expect(assigns(:vuitton_products)).to match(vuitton_products)
    end

    # @supreme_productsのテスト
    it "assigns the requested supreme_products to @supreme_products" do
      supreme_products = create_list(:product, 4, brand_id: 3)
      get :index
      expect(assigns(:supreme_products)).to match(supreme_products)
    end

    # @nike_productsのテスト
    it "assigns the requested nike_products to @nike_products" do
      nike_products = create_list(:product, 4, brand_id: 4)
      get :index
      expect(assigns(:nike_products)).to match(nike_products)
    end

    # ビュー遷移のテスト
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end

  end

end
