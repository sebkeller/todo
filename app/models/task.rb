class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, length: { maximum: 1000 }
end
