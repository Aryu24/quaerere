class BuyPost < ApplicationRecord

  validates :title, :category, :brand, :maximum_price, :condition, :comment, presence: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :offers, dependent: :destroy

  attachment :image

  enum status:{ 募集中:true, 募集終了:false}
  enum condition:{ 新品、未使用:0, 未使用に近い:1, 目立った傷や汚れなし:2, やや傷や汚れあり:3, 傷や汚れあり:4, 全体的に状態が悪い:5}

  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end