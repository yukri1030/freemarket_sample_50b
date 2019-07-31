class Size < ActiveHash::Base
  field :size
  create id: 0, size: '---'
  create id: 1, size: 'XXS以下'
  create id: 2, size: 'XS(SS)'
  create id: 3, size: 'S'
  create id: 4, size: 'M'
  create id: 5, size: 'L'
  create id: 6, size: 'XL(LL)'
  create id: 7, size: '2XL(3L)'
  create id: 8, size: '3XL(4L)'
  create id: 9, size: '4XL(5L)以上'
  create id: 10, size: 'FREE SIZE'

  # has_many :product

end