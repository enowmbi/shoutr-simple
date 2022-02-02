# frozen_string_literal: true

module UserHelper
  def follow_button(user)
    if current_user.following?(user)
      button_to("Unfollow", unfollow_user_path(user))
    else
      button_to("Follow", follow_user_path(user))
    end
  end

  def followers_button(user)
    link_to("Followers", user_followers_path(user))
  end
end
