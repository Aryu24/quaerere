class Offer < ApplicationRecord

  validates :price, :image, :condition, :comment, :public_status, presence: true

  belongs_to :user
  belongs_to :buy_post

  has_many :offer_comments, dependent: :destroy
  has_one :trade, validate: true

  attachment :image

  enum condition: { 新品、未使用:0, 未使用に近い:1, 目立った傷や汚れなし:2, やや傷や汚れあり:3, 傷や汚れあり:4, 全体的に状態が悪い:5}
  enum public_status: { 全体に公開: true, 募集人にのみ公開: false}

end
