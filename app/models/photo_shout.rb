# frozen_string_literal: true

class PhotoShout < ApplicationRecord
  has_many :shouts, as: :shoutable, dependent: :destroy

  has_one_attached :image do |attachable|
    attachable.variant :thumbnail, resize_to_limit: [200, 150]
  end
end
