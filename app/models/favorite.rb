class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :buy_post

end
