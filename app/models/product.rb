class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images
  has_one :deal, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :size, optional: true
  belongs_to :brand, optional: true
  with_options presence: true do
    validates :name, :text, :price, :category_id, :size, :status, :shipping_fee_payer, :delivery_method, :prefecture_id, :delivery_time
  end
  validates :price, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999}


  
    # ピックアップカテゴリーのproductsの配列を生成するメソッド
    def self.pickup_category_products(id)
      # 引数で渡されたidの子カテゴリのidの配列を生成
      child_category_ids = Category.find(id).children.ids
      # 子カテゴリのidと合致する孫カテゴリのidの配列を生成
      grand_child_category_ids = Category.where("parent_id IN (?)", child_category_ids).ids
      # 孫カテゴリのidと合致するproductsの配列を生成
      products = Product.where("category_id IN (?)", grand_child_category_ids)
      # 最新の４件を取得
      products.order("created_at DESC").limit(4)
    end
  
    # ピックアップブランドのproductsの配列を生成するメソッド
    def self.pickup_brand_products(brand_name)
      pickup_brand_id = Brand.find_by(name: brand_name).id
      Product.where(brand_id: pickup_brand_id).order("created_at DESC").limit(4)
    end



end
