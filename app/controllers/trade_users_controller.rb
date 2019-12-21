class TradeUsersController < ApplicationController

	def update
		@trade_user = TradeUser.find(params[:id])
		@trade_user.finish_status = "true"
		@trade_user.save
		@trade = Trade.find(@trade_user.trade_id)
		if @trade.status == "未完了"
			@trade.status = "完了待ち"
			@trade.save
			redirect_to trade_path(@trade)
		elsif @trade.status == "完了待ち"
			@trade.status = "取引完了"
			@trade.save
			redirect_to trade_path(@trade)
		end
	end
end
