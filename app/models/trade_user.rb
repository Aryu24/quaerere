class TradeUser < ApplicationRecord

  belongs_to :trade
  belongs_to :user

  enum side: { buy:0, offer:1}
end
