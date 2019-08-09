crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end

crumb :cards_index do
  link "支払い方法", user_cards_path(current_user)
  parent :mypage
end

crumb :logout do
  link "ログアウト", new_user_logout_path(current_user)
  parent :mypage
end

crumb :user_confirmation do
  link "本人情報の登録", edit_user_user_confirmation_path(current_user, 1)
  parent :mypage
end




  #### 以下はビュー作成次第対応予定
  # カテゴリ一覧
  # 親カテゴリ
  # 子カテゴリ
  # 孫カテゴリ
  # ブランド一覧
  # 各ブランド
