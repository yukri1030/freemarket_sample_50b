
class Profile < ApplicationRecord
  mount_uploader :avatar, ImagesUploader
  belongs_to :user

  validates :phone_number, presence: true, on: :sms_confirmation_send
  with_options presence: true,on: :hoge  do
    validates  :zipcode, :address_prefecture, :address_city, :address_street_number
  end

end