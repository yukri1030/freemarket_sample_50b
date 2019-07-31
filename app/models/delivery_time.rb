class DeliveryTime < ActiveHash::Base
  field :delivery_time
  create id: 0, delivery_time: '---'
  create id: 1, delivery_time: '1~2日で発送'
  create id: 2, delivery_time: '2~3日で発送'
  create id: 3, delivery_time: '4~7日で発送'

  # has_many :product
end