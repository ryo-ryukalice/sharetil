class FollowController < ApplicationController
  def create
    @user = User.find(params[:followee_id])
    current_user.follow(@user) unless current_user.following?(@user)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user) if current_user.following?(@user)
    redirect_to root_path
  end
end
