# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
    @user = User.new
  end

  def address_registration
    @user = User.new(post_params)
  end

  # POST /resource
  def create
    @user = User.new(post_params)
    if params[:back]
      render :new
      return
    else
      if @user.save
        sign_up(resource_name, resource)
        redirect_to new_user_registration_complete_path
        return
      else
        render :address_registration
      end
    end
  end

  def registration_complete
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def post_params
    params.require(:user).permit(:nick_name, :last_name, :first_name, :last_name_read, :first_name_read, :phone_number, :email, :password, :password_confirmation, :postcode, :prefecture_code, :address_city, :address_street, :address_building)
  end
end
