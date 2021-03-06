# frozen_string_literal: true

class Shout < ApplicationRecord
  belongs_to :shoutable, polymorphic: true
  belongs_to :user

  delegate :username, to: :user

  default_scope { order(created_at: :desc) }
end
