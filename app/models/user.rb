class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_one :card, dependent: :destroy

  accepts_nested_attributes_for :profile
  
  validates :nickname, presence: true, exclusion: { in: %w(メルカリ) }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])[a-z\d]+\z/i }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

  def self.profile_nested_with_user_is_valid?(params)
    params[:user][:profile_attributes][:family_name].present?\
    && params[:user][:profile_attributes][:last_name].present?\
    && params[:user][:profile_attributes][:family_name_kana].present?\
    && params[:user][:profile_attributes][:last_name_kana].present?\
    && params[:user][:profile_attributes][:'birth_ymd(1i)'].present?\
    && params[:user][:profile_attributes][:'birth_ymd(2i)'].present?\
    && params[:user][:profile_attributes][:'birth_ymd(3i)'].present?
  end
end
