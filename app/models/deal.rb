class Deal < ApplicationRecord
  belongs_to :buyer, foreign_key: :buyer_id, class_name: :User, optional: true
  belongs_to :seller, foreign_key: :seller_id, class_name: :User
  belongs_to :position
  belongs_to :product

  validates :product_id, presence: true, uniqueness: true
end
