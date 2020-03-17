class Work < ApplicationRecord
  validates :title, presence: true
  validates :release, presence: true
  validates :starring, presence: true
  validates :description, presence: true
  scope :by_new, ->{ order(updated_at: :desc) }

end
