# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :request_signin, only: [:new]
  before_action :set_user, only: %i[show edit update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(user_path(@user), notice: "User successfully created!")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @shouts = current_user.shouts
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to(user_path(@user), notice: "User successfully updated!")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user ||= User.find_by(username: params[:id])
  end
end
