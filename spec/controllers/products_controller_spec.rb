require 'rails_helper'

describe ProductsController do
  describe "GET #edit" do

    before do
      brand = create(:brand)
      category= create(:category)
      size = create(:size)
    end

    # インスタンス変数（@product）のテスト
    it "assigns the requested product to @product" do
      product = create(:product)
      get :edit, params:{ id: product }
      expect(assigns(:product)).to eq product

    end

    # ビュー遷移のテスト
    it "renders the :edit template" do
      product = create(:product)
      get :edit, params:{ id: product }
      expect(response).to render_template :edit
    end

  end
end
