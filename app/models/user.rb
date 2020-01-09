class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nick_name, :last_name, :first_name, :last_name_read, :first_name_read, :phone_number, :postcode, :prefecture_code, :address_city, :address_street, presence: true
  validates :nick_name, length: { in:1..20}
  validates :last_name, length: { in:1..35}
  validates :first_name, length: { in:1..35}
  validates :last_name_read, length: { in:1..35}
  validates :first_name_read, length: { in:1..35}
  validates :phone_number, length: { in:1..11}
  validates :postcode, length: { is:7}
  validates :prefecture_code, length: { in:3..4}
  validates :address_city, length: { in:1..7}
  validates :address_street, length: { in:1..30}
  validates :address_building, length: { maximum: 30}
  validates :introduction, length: { maximum: 1000}

  has_many :buy_posts
  has_many :favorites, dependent: :destroy
  has_many :offers
  has_many :trade_users
  has_many :trades, through: :trade_users
  has_many :trade_messages
  attachment :image

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end