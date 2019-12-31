class TradeMessagesController < ApplicationController

	def index
		redirect_to root_path
	end

	def create
		@trade = Trade.find(params[:id])
		@message = TradeMessage.new(trade_message_params)
		@message.user_id = current_user.id
		@message.trade_id = @trade.id
		if @message.save
			redirect_to trade_path(@trade)
		else
			render "trades/show"
		end
	end

	def destroy
	end

	private
	def trade_message_params
		params.require(:trade_message).permit(:message)
	end
end
