class TradeMessage < ApplicationRecord

  validates :message, presence: true

  belongs_to :trade
  belongs_to :user

end
