class OffersController < ApplicationController

  def index
  end

  def new
  	@offer = Offer.new
  end

  def create
  	@offer = Offer.new(offer_params)
  	@offer.user_id = current_user.id
  	@offer.buy_post_id = params[:id]
  	if @offer.save
  		redirect_to buy_post_path(@offer.buy_post.id)
  	else
  		render :new
  	end
  end

  def show
  	@offer = Offer.find(params[:id])
  	@offer_comment = OfferComment.new
  	@trade = Trade.all
  end

  def edit
  	@offer = Offer.find(params[:id])
  end

  def update
  	if Offer.exists?(params[:id]) #削除→戻る→変更された時のエラー対策
		@offer = Offer.find(params[:id])
		if @offer.update(offer_params)
			redirect_to offer_path(@offer)
		else
			render :edit
		end
	else
		redirect_to root_path #該当のオファーは削除されています的なflashあるといいかも
	end
  end

  def destroy
  	@offer = Offer.find(params[:id])
  	if @offer.delete
  		redirect_to buy_post_path(@offer.buy_post_id)
  	else
  		render :edit
  	end
  end

  private
  def offer_params
  	params.require(:offer).permit(:title, :price, :image, :condition, :comment, :public_status)
  end

end
