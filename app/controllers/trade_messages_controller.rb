class TradeMessagesController < ApplicationController

	def create
		@trade = Trade.find(params[:id])
		@message = TradeMessage.new(trade_message_params)
		@message.user_id = current_user.id
		@message.trade_id = @trade.id
		@message.save
		redirect_to trade_path(@trade)
	end

	def destroy
	end

	private
	def trade_message_params
		params.require(:trade_message).permit(:message)
	end
end
