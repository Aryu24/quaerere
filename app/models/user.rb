class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buy_posts
  has_many :favorites, dependent: :destroy
  has_many :offers
  has_many :trade_users
  has_many :trade_messages
  attachment :image
end
