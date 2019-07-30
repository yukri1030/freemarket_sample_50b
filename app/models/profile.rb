class Profile < ApplicationRecord
  belongs_to :user

  validates :phone_number, presence: true, on: :sms_confirmation_send
  validates :family_name, presence: true
  validates :last_name, presence: true
  validates :family_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_ymd, presence: true
  with_options presence: true,on: :hoge  do
    validates  :zipcode, :address_prefecture, :address_city, :address_street_number
  end

end
