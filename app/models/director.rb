class Director < ApplicationRecord
  has_many :works
  validates :name, presence: true
  validates :from, presence: true
  scope :by_name, ->{ order(name: :asc) }

  before_save :capitalize_name
  def capitalize_name
    self.name = self.name.split.map(&:capitalize).join(' ')
  end
end
