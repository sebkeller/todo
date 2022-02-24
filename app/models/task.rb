class Task < ApplicationRecord
  belongs_to :user
  acts_as_list scope: :user

  validates :title, presence: true, length: { maximum: 200 }
  validates :description, length: { maximum: 1000 }
end
