class FavoritesController < ApplicationController

	def create
		buy_post = BuyPost.find(params[:buy_post_id])
		favorite = current_user.favorites.new(buy_post_id: buy_post.id)
		favorite.save
		redirect_to buy_post_path(buy_post)
	end

	def destroy
		buy_post = BuyPost.find(params[:buy_post_id])
		favorite = current_user.favorites.find_by(buy_post_id: buy_post.id)
		favorite.destroy
		redirect_to buy_post_path(buy_post)
	end
end
