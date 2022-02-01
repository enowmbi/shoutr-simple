# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL_FORMAT = /\w+@\w+\.[a-z]{2,3}/
  has_secure_password

  has_many :shouts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_shouts, through: :likes, source: :shout

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

  def to_param
    username
  end
end
