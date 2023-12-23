# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  skip_before_action :authorized, except: [:destroy]
  
  # GET /resource/sign_in
  def new
    super
  end

  def create
    @user = current_user 
    session[:jwt_token]= encode_token(user_id: @user.id, updated_at: @user.updated_at)
    redirect_to dashboard_index_path
  end

  def destroy
    super
    root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
