class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, except: [:show]

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to root_path unless @user == current_user
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
  end

  def offers
    @user = current_user
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
