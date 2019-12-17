class BuyPostsController < ApplicationController

	def index
		@search = BuyPost.ransack(params[:q])
		@buy_posts = @search.result.page(params[:page])
	end

	def show
		@buy_post = BuyPost.find(params[:id])
	end

	def new
		@buy_post = BuyPost.new
	end

	def create
		@buy_post = BuyPost.new(buy_post_params)
		@buy_post.user_id = current_user.id
		if @buy_post.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@buy_post = BuyPost.find(params[:id])
	end

	def update
		if BuyPost.exists?(params[:id]) #削除→戻る→変更された時のエラー対策
			@buy_post = BuyPost.find(params[:id])
			if @buy_post.update(buy_post_params)
				redirect_to buy_post_path(@buy_post)
			else
				render :edit
			end
		else
			redirect_to root_path #該当の投稿は削除されています的なflashあるといいかも
		end
	end

	def destroy
		@buy_post = BuyPost.find(params[:id])
		if @buy_post.delete
			redirect_to root_path
		else
			render :edit
		end
	end

	private
	def buy_post_params
		params.require(:buy_post).permit(:id, :title, :image, :category, :brand, :maximum_price, :condition, :comment)
	end
end
