class Trade < ApplicationRecord

  belongs_to :offer

  has_many :trade_users
  has_many :trade_messages

  enum status: { 未完了:0, 完了待ち:1, 取引完了:2}

end
