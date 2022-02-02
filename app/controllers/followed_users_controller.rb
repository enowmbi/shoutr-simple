# frozen_string_literal: true

class FollowedUsersController < ApplicationController
  def create
    user_to_follow = find_user
    current_user.follow(user_to_follow)
    redirect_to user_to_follow
  end

  def destroy
    followed_user = find_user
    current_user.unfollow(followed_user)
    redirect_to followed_user
  end

  private

  def find_user
    @user ||= User.find_by(username: params[:id])
  end
end
