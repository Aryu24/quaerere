class OfferCommentsController < ApplicationController

	def create
		@offer = Offer.find(params[:id])
		offer_comment = OfferComment.new(offer_comment_params)
		offer_comment.user_id = current_user.id
		offer_comment.offer_id = @offer.id
		offer_comment.save
		redirect_to offer_path(@offer)
	end

	def destroy
	end

	private
	def offer_comment_params
		params.require(:offer_comment).permit(:comment)
	end
end
