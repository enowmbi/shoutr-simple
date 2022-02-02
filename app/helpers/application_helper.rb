# frozen_string_literal: true

module ApplicationHelper
  def display_signin_signout_button
    if user_signed_in?
      link_to "Sign out", signout_path, data: { "turbo-method": :delete }
    else
      "#{link_to_unless_current 'Sign in', signin_path}
      |
      #{link_to_unless_current 'Sign up', signup_path}".html_safe
    end
  end
end
