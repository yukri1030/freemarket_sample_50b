## ER図

[![Image from Gyazo](https://i.gyazo.com/239df1f1bd84b7c4da0dcb3084e36dd0.png)](https://gyazo.com/239df1f1bd84b7c4da0dcb3084e36dd0)

## Users

|Column|Type|Options|
|------|----|-------|
|id| | |
|nickname|string|null: false|
|email|string|null: false, uniqure: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- has_many :comments
- has_many :post_reviews, foreign_key: :reviewer_id, class_name: :Review
- has_many :receive_reviews, foreign_key: :reviewed_id, class_name: :Review
- has_one :profile
- has_one :card
- has_many :buyed_deals, foreign_key: :buyer_id, class_name: :Deal
- has_many :selling_deals, -> { where("buyer_id is NULL") }, 
- has_many :sold_deals, -> { where("buyer_id is not NULL") }, foreign_key: :seller_id, class_name: :Deal
- has_many :buyed_products, through: :buyed_deals, source: :product
- has_many :selling_products, through: :selling_deals, source: :product
- has_many :sold_products, through: :sold_deals, source: :product

## Profiles

|Column|Type|Options|
|------|----|-------|
|id| | |
|profile_comment|text|
|avatar|string|
|family_name|string|null: flase|
|last_name|string|null: false|
|family_name_kana|string|null: false |
|last_name_kana|string|null: false|
|birth_ymd|date|null: false|
|zipcode|string|null: false|
|adderss_prefecture|string||
|address_city|string|null: false|
|address_street_number|string|null: false|
|address_building_name|string| |
|phone_number|string|unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## Prefectures

|Column|Type|Options|
|------|----|-------|
|id| | |
|prefecture|string|null: false, active-hash|

### Association
- has_many :profiles
- belongs_to :product

## Users_products

|Column|Type|Options|
|------|----|-------|
|id| | |
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|payjp_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :payjp

## Products

|Column|Type|Options|
|------|----|-------|
|id| | |
|name|string|null: false, index: true|
|size_id|references|null: false, foreign_key: true|
|status|string|null: false|
|text|text|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|optioanal: true, foreign_key: true|
|shipping_fee_payer|string|null: false|
|delivery_method|string|null: false|
|delivery_from_area|string|null: false|
|delivery_time|references|null: false|
|created_at|daytime|null: false|
|updated_at|daytime|null: false|

### Association
- has_many :comments
- has_many :product_images
- accepts_nested_attributes_for :product_images
- has_one :deal
- belongs_to :size
- belongs_to :category
- belongs_to :brand

## Product_images

|Column|Type|Options|
|------|----|-------|
|id| | |
|image_url|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product

## Categories

|Column|Type|Options|
|------|----|-------|
|id| | |
|name|string|null: false, uniqure: true|
|parent_id|references|optional: true, foreign_key, true|

### Association
- has_many :products
- has_many :children, class_name: :Category, foreign_key: :parent_id
- belongs_to :parent, class_name: :Category
- has_many :size_categories
- has_many :sizes, through: :size_categories

## Positions

|Column|type|Options|
|------|----|-------|
|id| | |
|name|string|null: false, unique: true|

### Association
- has_many: deals

## Brands

|Column|type|Options|
|------|----|-------|
|id| | |
|name|string|null: false, uniqure: true|

### Association
- has_many :products

## Sizes

|Column|Type|Options|
|------|----|-------|
|id| | |
|name|string|null: false, uniqure: true|

### Association
- has_many :products
- belongs_to_active_hash :category, through: :sizes_categories

## Sizes_categories

|Column|Type|Options|
|------|----|-------|
|id| | |
|category_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|

### Association
- belongs_to :size, dependent: :destroy
- belongs_to :category, dependent: :destroy

## 'Positions'

|Column|Type|Options|
|------|----|-------|
|id| | |
|name|string|null:false, unique: true|

### Association
- has_many: deals

## 'Status'

|Column|Type|Options|
|------|----|-------|
|id| | |
|status|string|null:false, active-hash|

### Association
- has_many :products

## Delivery_times

|Column|Type|Options|
|------|----|-------|
|id| | |
|delivery_times|string|null: false|

### Association
- has_many :products

## Evaluations

|Column|Type|Options|
|------|----|-------|
|id| | |
|evaluation|integer|null: false, active-hash|

### Association
- has_many :users, through: :users_evaluations

## Users_evaluations

|Column|Type|Options|
|------|----|-------|
|id| | |
|evaluation_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :evaluation
