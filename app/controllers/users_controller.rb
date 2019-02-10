class UsersController < ApplicationController
  def show
  end

  def update
    current_user.update(users_params)
    redirect_to profile_path
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
