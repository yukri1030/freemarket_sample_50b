products=[["NIKE セーラー", 3400,5760,93], ["NIKE  トップス", 10000,5760,93], ["NIKE 専用ベール",2300,5760,93],["NIKE  セーラー", 3400,5760,93],["ルイ ヴィトン セーラー", 3400,9410,159], ["ルイ ヴィトン トップス", 10000,9410,159], ["ルイ ヴィトン専用ベール",2300,9410,159],["ルイ ヴィトン セーラー", 3400,9410,159], ["ZARA トップス", 10000,3436,159], ["★様専用ベール",2300,3995,159], ["レピピ アルマリオ ブラウス", 810,91,942], ["タグ付 デッド Columbia \"PFG\" フィッシングシャツ XL 90's", 6800,388,945], ["デニムジャケット Gジャン ローリーズファーム", 1300,91,943], ["SHELLAC ハラコレザー長財布　スタッズ", 2500,943], ["安全靴 ミドリ安全 g3690 未使用新品 25.5", 2800,339], ["パジャマ 90", 333,91,476], ["ラルフローレン キッズ シャツ", 2000,476], ["レギンス スパッツ", 500,388,476], ["FCS グローブ マリン ウェット クロロプレン 海遊び 保温 ジェット 新品", 1800,388,476], ["ma( ^O^ ) 様専用です^^*", 1800,3912,868], ["ネイルチップ 成人式 ネイル", 610,3912,942], ["りすこさん専用 ノーモア ブラック ヘッド", 1200,3912,476], ["Diorとサンプルセット", 2250,3912,868], ["残多☆CHANEL☆パウダーファンデ # 10", 5780,3912,868], ["試し程度☆CHANEL☆パウダーファンデ # 20", 5980,3912,868], ["CHANEL シャネル 長財布", 37444,3912,159], ["シャネルシューズ袋 二枚セット", 2000,3912,159], ["❤️未使用に近い ルイヴィトン エピ ルイーズ 長財布 正規品 鑑定済み❤️", 72550,3912,159], ["[美品]LOUIS VUITTON ポルトカルト・サンプル カードケース 定期入", 24000,3912,159], ["正規品 タグ付 ルイヴィトン ダミエ 10枚カード ファスナー長財布", 13600,3912,159], ["❤️美品 ルイヴィトン エピ ジッピーウォレット 長財布 正規品 鑑定済み❤️", 29800,3912,159], ["supreme sekintani Supreme Tee", 7900,4039,339], ["supreme ニット帽", 11400,4039,339], ["supreme 17ss ロンT", 8000,4039,339], ["ゴッキュー様専用", 12500,4039,339], ["ナイキ プーマ スポーツブラ XL", 1900,5760,339], ["ナイキ ロンパース つなぎ 90", 1555,5760,339], ["NIKE ナイキ Tシャツ テニスウェア 130cmナダルモデル", 2500,5760,339], ["ナイキ 140 長袖", 5760,339]]
products.each do |product|
Product.create(
  name:product[0],
  price:product[1],
  brand_id:product[2],
  category_id:product[3], 
  text:'テスト出品です',
  size_id:rand(1..10),
  shipping_fee_payer:"送料込み（出品者負担）",
  delivery_method:"らくらくメルカリ便",
  delivery_from_area:"北海道",
  delivery_time:"1~2日で発送",
  status:"目立った傷や汚れなし")
end