class Director < ApplicationRecord
  validates :name, presence: true
  validates :from, presence: true
  scope :by_name, ->{ order(name: :asc) }
end
