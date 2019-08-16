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
|product_name|text|null: false|
|description|text|null: false|
|status_id|references|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|shipping_fee_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|prefecture_id|references|null: false, foreign_key: true|
|delivery_time_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|created_at|daytime|null: false|
|updated_at|daytime|null: false|

### Association
- belongs_to :user
- has_many :product_images
- has_many :users, through: :users_products
- has_many :users, through: :likes
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :brand
- belongs_to_active_hash :shipping_fee_payer
- belongs_to_active_hash :delivery_method
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_time

## Product_images

|Column|Type|Options|
|------|----|-------|
|id| | |
|image|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product

## Likes

|Column|Type|Options|
|------|----|-------|
|id| | |
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user

## Categories

|Column|Type|Options|
|------|----|-------|
|id| | |
|main_category_id|references|null: false, foreign_key: true, active-hash|
|middle_category_id|references|null: false, foreign_key: true, active-hash|
|small_category_id|references|null: false, foreign_key: true, active-hash|


### Association
- has_many :products
- has_many :sizes, through :sizes_categories

## Brands

|Column|type|Options|
|------|----|-------|
|id| | |
|brand_name|string|null: false|

### Association
- has_many :products

## Sizes

|Column|Type|Options|
|------|----|-------|
|id| | |
|size|string|null: false, active-hash|

### Association
- has_many :products
- belongs_to_active_hash :category, through: :sizes_categories

## 'Status'

|Column|Type|Options|
|------|----|-------|
|id| | |
|status|string|null:false, active-hash|

### Assonciation
- has_many :products

## Sizes_categories

|Column|Type|Options|
|------|----|-------|
|id| | |
|category_id|references|null: false, foreign_key: true, active-hash|
|size_id|references|null: false, foreign_key: true, active-hash|

### Association
- belongs_to_active_hash :size
- belongs_to_active_hash :category

## Shipping_fee_payers

|Column|Type|Options|
|------|----|-------|
|id| | |
|payer_name|string|null: false, active-hash|

### Association
- has_many :products

## Delivery_times

|Column|Type|Options|
|------|----|-------|
|id| | |
|delivery_times|string|null: false, active-hash|

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
- belongs_to_active_hash :evaluation
