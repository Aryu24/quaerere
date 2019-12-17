class RenameFromPublicToPublicStatusOnOffer < ActiveRecord::Migration[5.2]
  def change
  	rename_column :offers, :public, :public_status
  end
end
