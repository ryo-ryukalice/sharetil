class FolloweesController < ApplicationController
  before_action :set_user

  def index
    @followees = @user.followees
  end

  private

  def set_user
    @user = User.find_by!(nickname: params[:user_nickname])
  end
end
