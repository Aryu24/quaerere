class OfferComment < ApplicationRecord

  validates :comment, presence: true
  validates :comment, length: { in:1..500}

  belongs_to :user
  belongs_to :offer

end
