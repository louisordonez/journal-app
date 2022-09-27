class Category < ApplicationRecord
  has_many :tasks
  belongs_to :user, optional: true

  validates :name, presence: true, length: { minimum: 2 }
end
