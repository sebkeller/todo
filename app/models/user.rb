class User < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }

  EMAIL_REGEX = /@/.freeze

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
end
