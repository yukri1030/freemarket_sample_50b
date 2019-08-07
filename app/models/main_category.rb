class Main_category < ActiveHash::Base
  field :main_category
  create id: 0, main_category: '----'
  create id: 1, main_category: 'レディース'
  create id: 2, main_category: 'メンズ'
  create id: 3, main_category: 'ベビー・キッズ'
  create id: 4, main_category: 'インテリア・住まい・小物'
  create id: 5, main_category: '本・音楽・ゲーム'
  create id: 6, main_category: 'おもちゃ・ホビー・グッズ'
  create id: 7, main_category: 'コスメ・香水・美容'
  create id: 8, main_category: '家電・スマホ・カメラ'
  create id: 9, main_category: 'スポーツ・レジャー'
  create id: 10, main_category: 'ハンドメイド'
  create id: 11, main_category: 'チケット'
  create id: 12, main_category: '自動車・オートバイ'
  create id: 13, main_category: 'その他'
  create id: 14, main_category: 'カテゴリー一覧'

  # has_many :categories
end
