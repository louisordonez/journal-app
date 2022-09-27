class Task < ApplicationRecord
  belongs_to :category, optional: true

  validates :title, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 2 }
  validates :deadline, presence: true
end
