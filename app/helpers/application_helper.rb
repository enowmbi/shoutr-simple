# frozen_string_literal: true

module ApplicationHelper
  def display_signin_signout_button
    if user_login?
      link_to "Sign out", signout_path, data: { "turbo-method": :delete }
    else
      link_to_unless_current "Sign in", signin_path
    end
  end
end
