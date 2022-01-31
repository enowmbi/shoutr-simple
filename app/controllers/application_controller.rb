class ApplicationController < ActionController::Base
  before_action :request_signin

  helper_method :user_login?, :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_login?
    !!current_user
  end


  def request_signin
    redirect_to(signin_path,notice: "please enter username/email and password to login") unless user_login?
  end
end
