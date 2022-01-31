class SessionsController < ApplicationController
  skip_before_action :request_signin, only: %i[new create destroy]
  def new; end

  def create
    user = find_user
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(root_path, notice: "You are now signed in")
    else
      flash.now[:warning] = "Incorrect Username or email and/or password"
      render :new, status: :unprocessable_entity 
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to signin_path, notice: "User successfully signed-out"
  end

  private

  def find_user
    User.find_by(username: params[:username_or_email]) || User.find_by(email: params[:username_or_email])
  end
end
