# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL_FORMAT = /\w+@\w+\.[a-z]{2,3}/
  has_secure_password

  validates :email, format: { with: EMAIL_FORMAT }
  validates :username, length: { within: 5..13 }
  validates :password, length: { within: 8..16 }
end
