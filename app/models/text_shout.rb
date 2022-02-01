# frozen_string_literal: true

class TextShout < ApplicationRecord
  has_many :shouts, as: :shoutable, dependent: :destroy

  validates :body, length: { within: 10..100 }
end
