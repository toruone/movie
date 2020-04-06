class Work < ApplicationRecord
  mount_uploader :image, WorkImageUploader
  belongs_to :director
  has_many :work_tags, dependent: :destroy
  has_many :tags, through: :work_tags

  acts_as_list

  validates :title, presence: true
  validates :release, presence: true
  validates :starring, presence: true
  validates :description, presence: true
  scope :by_new, ->{ order(updated_at: :desc) }
  scope :by_position, ->{order(position: :asc)}

  def related_works
    director.works.where.not(id: id)
  end
end
