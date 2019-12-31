class TradeMessage < ApplicationRecord

  validates :message, presence: true
  validates :message, length: { in:1..500}

  belongs_to :trade
  belongs_to :user

end
