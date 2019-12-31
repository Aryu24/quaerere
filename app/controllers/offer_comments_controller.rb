class OfferCommentsController < ApplicationController

	def index #バリデーション時に更新された時のエラー回避用
		redirect_to root_path
	end

	def create
		@offer = Offer.find(params[:id])
		@offer_comment = OfferComment.new(offer_comment_params)
		@offer_comment.user_id = current_user.id
		@offer_comment.offer_id = @offer.id
		if @offer_comment.save
			redirect_to offer_path(@offer)
		else
			@trade = Trade.all
			render "offers/show"
		end
	end

	def destroy
	end

	private
	def offer_comment_params
		params.require(:offer_comment).permit(:comment)
	end
end
