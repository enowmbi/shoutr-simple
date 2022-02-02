# frozen_string_literal: true

class FollowedRelationship < ApplicationRecord
  belongs_to :follower, class_name: "User", counter_cache: :followed_users_count
  belongs_to :followed_user, class_name: "User", counter_cache: :followers_count

  # validates :follower_id, uniqueness: { scope: :followed_user_id }
end
