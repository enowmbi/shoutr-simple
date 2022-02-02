# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL_FORMAT = /\w+@\w+\.[a-z]{2,3}/
  has_secure_password

  has_many :shouts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_shouts, through: :likes, source: :shout

  has_many :followed_relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :followed_relationships

  has_many :following_relationships, foreign_key: :followed_user_id, class_name: "FollowedRelationship", dependent: :destroy
  has_many :followers, through: :following_relationships

  validates :email, format: { with: EMAIL_FORMAT }
  validates :username, length: { within: 5..13 }
  validates :password, length: { within: 8..16 }

  def like(shout)
    liked_shouts << shout
  end

  def liked?(shout)
    liked_shout_ids.include?(shout.id)
  end

  def unlike(shout)
    liked_shouts.destroy(shout)
  end

  def follow(user)
    followed_users << user
  end

  def following?(user)
    followed_user_ids.include?(user.id)
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  def to_param
    username
  end
end
