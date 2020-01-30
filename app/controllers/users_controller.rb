class UsersController < ApplicationController
  before_action :set_user

  def show; end

  private

  def set_user
    @user = User.find_by!(nickname: params[:nickname])
  end
end
