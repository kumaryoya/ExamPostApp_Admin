class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def show; end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to profile_path, success: 'Profile was successfully updated.'
    else
      flash.now['danger'] = 'Failed to update the profile.'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name, :avatar, :avatar_cache)
  end
end
