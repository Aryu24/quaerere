class OfferComment < ApplicationRecord

  validates :comment, presence: true

  belongs_to :user
  belongs_to :offer

end
