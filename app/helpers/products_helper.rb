module ProductsHelper
  def get_category_name
    {'---':'---','レディース':'1','メンズ':'2','ベビー・キッズ':'3','インテリア・住まい・小物':'4','本・音楽・ゲーム':'5','おもちゃ・ホビー・グッズ':'6','コスメ・香水・美容':'7','家電・スマホ・カメラ':'8','スポーツ・レジャー':'9','ハンドメイド':'10','チケット':'11','自転車・オートバイ':'12','その他':'13'}
  end

  def get_status
    {'---':' ','新品、未使用':'新品、未使用','未使用に近い':'未使用に近い','目立った傷や汚れなし':'目立った傷や汚れなし','やや傷や汚れあり':'やや傷や汚れあり','傷や汚れあり':'傷や汚れあり','全体的に状態が悪い':'全体的に状態が悪い'}
  end

  def get_shipping_fee_payer
    {'---':' ','送料込み（出品者負担）':'送料込み（出品者負担）','着払い（購入者負担）':'着払い（購入者負担）'}
  end
  
  def get_delivery_time
    {'---':' ','1~2日で発送':'1~2日で発送','2~3日で発送':'2~3日で発送','4~7日で発送':'4~7日で発送'}
  end

  def get_search_categories
    {'すべて':'0', 'レディース':'1', 'メンズ':'2', 'ベビー・キッズ':'3', 'インテリア・住まい・小物':'4', '本・音楽・ゲーム':'5', 'おもちゃ・ホビー・グッズ':'6', 'コスメ・香水・美容':'7', '家電・スマホ・カメラ':'8' ,'スポーツ・レジャー':'9', 'ハンドメイド':'10', 'チケット':'11', '自転車・オートバイ':'12', 'その他':'13'}
  end

  def get_search_order
    {'並び替え':'0', '価格の安い順':'1', '価格の高い順':'2', '出品の古い順':'3', '出品の新しい順':'4', 'いいねの！の多い順':'5'}
  end

  def get_search_size
    {'すべて':'0', '洋服のサイズ':'1', 'メンズ靴のサイズ':'2', 'レディース靴のサイズ':'3', 'スカートのサイズ':'4', 'キッズ服のサイズ':'5', 'ベビー・キッズ靴のサイズ':'6', 'ベビー服のサイズ':'7', 'テレビのサイズ':'8', 'カメラレンズのサイズ':'9', 'オートバイのサイズ':'10', 'ヘルメットのサイズ':'11', 'タイヤのサイズ':'12', 'スキーのサイズ':'13', 'スノーボードのサイズ':'14'}
  end

  def get_search_price
    {'選択してください':'0', '300 ~ 1000':'1', '1000 ~ 5000':'2', '5000 ~ 10000':'3', '10000 ~ 30000':'4', '30000 ~ 50000':'5', '50000 ~':'6'}
  end
end