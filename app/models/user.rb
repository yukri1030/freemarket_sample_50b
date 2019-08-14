
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  accepts_nested_attributes_for :profile
  
  has_one :card, dependent: :destroy

  has_many :buyed_deals, foreign_key: :buyer_id, class_name: :Deal
  has_many :selling_deals, -> { where("buyer_id is NULL") }, foreign_key: :seller_id, class_name: :Deal
  has_many :sold_deals, -> { where("buyer_id is not NULL") }, foreign_key: :seller_id, class_name: :Deal

  has_many :buyed_products, through: :buyed_deals, source: :product
  has_many :selling_products, through: :selling_deals, source: :product
  has_many :sold_products, through: :sold_deals, source: :product

  validates :nickname, presence: true, exclusion: { in: %w(メルカリ) }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])[a-z\d]+\z/i }
  validates :password_confirmation, presence: true, length: { minimum: 6 }

      # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    @credential = SnsCredential.where(provider: auth.provider, uid: auth.uid,email:auth.info.email).first_or_create
    @user = User.where(email:auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.password_confirmation = Devise.friendly_token[0,20] 
    end
    @user
  end
end
