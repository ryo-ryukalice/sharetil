class SessionsController < ApplicationController
  def create
    session[:user_id] = authenticate_user(request.env['omniauth.auth']).id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def authenticate_user(auth_params)
    user = User.find_or_create_by(github_uid: auth_params.uid)
    raw_info = auth_params.extra.raw_info
    user.update!(name: raw_info.name, nickname: raw_info.login, avatar_url: raw_info.avatar_url, bio: raw_info.bio)
    user
  end
end
