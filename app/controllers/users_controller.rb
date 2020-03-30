class UsersController < ApplicationController
  def update
    @users = User.find(params[:id])
    @users.map{|r|
      if r.active?
        r.update!(active: 'false')
      else
        r.update!(active: 'true')
      end
      r
    }
    if current_user.active?
      redirect_to user_root_path
    else
      sign_out(current_user)
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to all_users_path, success: 'User delete successful'
  end
  after_action :user_activity

  private

  def user_activity
    current_user.try :touch
  end


  protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname])
  # end


end
