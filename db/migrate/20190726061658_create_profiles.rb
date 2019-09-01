class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string    :nickname
      t.text      :profile_comment
      t.string     :avatar
      t.string     :family_name
      t.string     :last_name
      t.string     :family_name_kana
      t.string     :last_name_kana
      t.string     :zipcode
      t.string     :address_prefecture
      t.string     :address_city
      t.string     :address_street_number
      t.string     :address_building_name
      t.date       :birth_ymd
      t.string     :phone_number
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
