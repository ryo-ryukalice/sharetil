class FolloweesController < ApplicationController
  before_action :set_user

  def index
    @followees = @user.followees
  end

  def create
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  private

  def set_user
    @user = User.find_by!(nickname: params[:user_nickname])
  end
end
