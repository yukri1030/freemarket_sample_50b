require 'rails_helper'

describe Product do

  describe '#create' do
    # アソシエーションの作成
    before do
      brand = create(:brand)
      category= create(:category)
      size = create(:size)
    end

    it "is valid with all collect" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without name" do
      product = build(:product,name:"")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without text" do
      product = build(:product,text:"")
      product.valid?
      expect(product.errors[:text]).to include("can't be blank")
    end

    it "is invalid without price" do
      product = build(:product,price:nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without category_id" do
      product = build(:product,category_id:nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without condition" do
      product = build(:product,condition:"")
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without delivery_fee_payer" do
      product = build(:product,delivery_fee_payer:"")
      product.valid?
      expect(product.errors[:delivery_fee_payer]).to include("can't be blank")
    end

    it "is invalid without delivery_type" do
      product = build(:product,delivery_type:"")
      product.valid?
      expect(product.errors[:delivery_type]).to include("can't be blank")
    end

    it "is invalid without delibery_from_area" do
      product = build(:product,delibery_from_area:"")
      product.valid?
      expect(product.errors[:delibery_from_area]).to include("can't be blank")
    end

    it "is invalid without delivery_days" do
      product = build(:product,delivery_days:"")
      product.valid?
      expect(product.errors[:delivery_days]).to include("can't be blank")
    end

    it "is valid with lowest price" do
      product = build(:product,price:300)
      expect(product).to be_valid
    end

     it "is valid with highest price" do
      product = build(:product,price:9_999_999)
      expect(product).to be_valid
    end

    it "is invalid with too low price" do
      product = build(:product,price:299)
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "is invalid with too high price" do
      product = build(:product,price:10_000_000)
      product.valid?
      expect(product.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "is valid without size_id" do
      product = build(:product,size_id:"")
      expect(product).to be_valid
    end
  end

  describe '#edit' do
    # アソシエーションの作成
    before do
      brand = create(:brand)
      category= create(:category)
      size = create(:size)
    end

    it "is valid with all collect" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without name" do
      product = build(:product,name:"")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without text" do
      product = build(:product,text:"")
      product.valid?
      expect(product.errors[:text]).to include("can't be blank")
    end

    it "is invalid without price" do
      product = build(:product,price:nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without category_id" do
      product = build(:product,category_id:nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without condition" do
      product = build(:product,condition:"")
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without delivery_fee_payer" do
      product = build(:product,delivery_fee_payer:"")
      product.valid?
      expect(product.errors[:delivery_fee_payer]).to include("can't be blank")
    end

    it "is invalid without delivery_type" do
      product = build(:product,delivery_type:"")
      product.valid?
      expect(product.errors[:delivery_type]).to include("can't be blank")
    end

    it "is invalid without delibery_from_area" do
      product = build(:product,delibery_from_area:"")
      product.valid?
      expect(product.errors[:delibery_from_area]).to include("can't be blank")
    end

    it "is invalid without delivery_days" do
      product = build(:product,delivery_days:"")
      product.valid?
      expect(product.errors[:delivery_days]).to include("can't be blank")
    end

    it "is valid with lowest price" do
      product = build(:product,price:300)
      expect(product).to be_valid
    end

     it "is valid with highest price" do
      product = build(:product,price:9_999_999)
      expect(product).to be_valid
    end

    it "is invalid with too low price" do
      product = build(:product,price:299)
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "is invalid with too high price" do
      product = build(:product,price:10_000_000)
      product.valid?
      expect(product.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "is valid without size_id" do
      product = build(:product,size_id:"")
      expect(product).to be_valid
    end
  end

end
