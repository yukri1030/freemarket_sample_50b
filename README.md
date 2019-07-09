## ER図

[![Image from Gyazo](https://i.gyazo.com/fc509b36516add007770cb74d9b67890.png)](https://gyazo.com/fc509b36516add007770cb74d9b67890)

## Users

|Column|Type|Options|
|------|----|-------|
|last-name|string|index: true, null: false|
|first-name|string|index: true, null: false|
|first-name-kana|string|index: true, null: false|
|last-name-kana|string|index: true, null: false|
|mail|string|null: false|
|password|string|null: false|
|phone|integer|null: false|
|birthday|data|null: false|

### Association
- has_one :profile
- has_many :buyers
- has_many :addresses
- has_many :cards
- has_many :products
- has_many :comments
- has_many :likes
- has_many :reviews

## Profiles

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: flase|
|avatar|string| |
|description|text| |
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## Addresses

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|full-name|string|index: true, null: false|
|full-name-kana|string|index: true, null: false|
|zip|integer|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|address|string|null: false|
|phone|integer|null: false|

### Association
- belongs_to :user

## Cards

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|number|integer|null: false|
|valid_year|integer|null: false|
|valid_month|integer|null: false|

### Association
- belongs_to :user

## Products

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|description|text|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|size_id|references|foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|shipping-fee_id|references|null: false, foreign_key: true|
|delivery_method_id|references|foreign_key: true|
|prefecture_id|references|null: false, foreign_key: true|
|delivery_time_id|references|null: false, foreign_key: true|
|status_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :product_images
- has_many :comments
- has_many :likes
- has_many :buyers

## Product_image

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product

## Comments

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :product
- belongs_to :user

## Likes

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user

## Buyer

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|address_id|references|null: false, foreign_key: true|
|support_id|references|null: false, foreign_key: true|
|message_id|references|foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user

## Reviews

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|evalation_id|references|null: false, foreign_key: true|

### Association
- beloungs_to :buyer
- belongs_to :user

## Messages

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|message|text|null: false, foreign_key: true|

### Association
- belongs_to :buyer
- belongs_to :user

## Main_categories

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Middle_categories

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|main_category_id|references|null: false, foreign_ky: true|

## Small_categories

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|main_category_id|references|null: false, foreign_key: true|

## Brands

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Size

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Category_brand

|Column|Type|Options|
|------|----|-------|
|small_category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|

## Category_size

|Column|Type|Options|
|------|----|-------|
|small_category_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|

## Conditions

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Shipping-fee

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Delivery_method

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Prefecture

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Delivery_time

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Status

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Evaluations

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Position

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## Support

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
