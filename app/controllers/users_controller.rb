class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	before_action :correct_user, except: [:show]

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to root_path unless @user == current_user
  end

  def index
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
  end

  def mypage
  	@user = current_user
  end

  def favorites
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def profile_edit
    @user = current_user
  end

  def buy_posts
    @user = current_user
    trade_id =  TradeUser.where(user_id: current_user).where(side: "buy")
    @trading = []
    @end_trade = []
    unless trade_id.nil? #ユーザーがTradeしているか？
      trade_id.each do |f|
        if f.trade.status == "取引完了"
          @end_trade.push(f.trade)
        else
          @trading.push(f.trade)
        end
      end
    end
  end

  def offers
    @user = current_user
    @offers = []
    trade_offers = []
    @user.offers.each do |f|
      if f.trade.nil?
        @offers.push(f) #@offersにtradeがないオファーを格納
      else
        trade_offers.push(f) #trade_offersにtradeがあるオファーを格納
      end
    end
    unless trade_offers.nil? #trade_offersがnilでなければ
      @trading_offers = []
      @end_trade_offers = []
      trade_offers.each do |f| #tradeがあるofferから完了or未完了を選別
        if f.trade.status != "取引完了"
          @trading_offers.push(f) #取引中のものを@trading_offersに
        else
          @end_trade_offers.push(f) #取引完了のものを@end_trade_offersに
        end
      end
    end
  end

  def trades
    @trade_users = TradeUser.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_mypage_path(current_user)
    else
      if params[:profile]
        render :profile_edit
      else
        render :edit
      end
    end
  end

  private
    def user_params
    	params.require(:user).permit(:password, :password_confirmation, :email, :nick_name, :last_name, :first_name, :last_name_read, :first_name_read, :phone_number, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :image, :introduction)
  	end
end
