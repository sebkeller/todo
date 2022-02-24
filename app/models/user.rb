class User < ApplicationRecord
  EMAIL_REGEX = /@/.freeze

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
end
