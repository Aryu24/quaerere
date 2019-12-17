class ChangeCommentOnOffer < ActiveRecord::Migration[5.2]
  def change
  	change_column :offers, :comment, :text
  end
end
