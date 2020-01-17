class TradesController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:show]

	def correct_user
		@trade = Trade.find(params[:id])
		redirect_to root_path unless @trade.trade_users.where(user_id: current_user.id).exists?
	end

	def create
		@trade = Trade.new
		@offer = Offer.find(params[:id])
		@trade.offer_id = @offer.id
		@trade.save

		TradeUser.create(:trade_id => @trade.id, :user_id => @trade.offer.buy_post.user_id, :side => "buy")
		TradeUser.create(:trade_id => @trade.id, :user_id => @trade.offer.user_id, :side => "offer")

		@buy_post = BuyPost.find(@offer.buy_post_id)
		@buy_post.update(status: "募集終了")

		redirect_to trade_path(@trade)
	end

	def show
		@trade = Trade.find(params[:id])
		@message = TradeMessage.new
	end

	private
	def trade_params
		params.require(:trade).permit(:status)
	end
end
