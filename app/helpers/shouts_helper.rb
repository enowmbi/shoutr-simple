# frozen_string_literal: true

module ShoutsHelper
  def like_button(shout)
    if current_user.liked?(shout)
      link_to("Unlike", unlike_shout_path(shout), data: { "turbo-method": :delete })
    else
      link_to("Like", like_shout_path(shout), data: { "turbo-method": :post })
    end
  end
end
