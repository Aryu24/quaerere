class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, except: [:show]

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to root_path unless @user == current_user
  end

  def show
  end

  def mypage
  	@user = current_user
  end

  def edit
  end

  def update
  end

  private
    def user_params
    	params.require(:user).permit(:password, :password_confirmation, :email, :nick_name, :last_name, :first_name, :last_name_read, :first_name_read, :phone_number, :postcode, :address_street)
  	end
end
