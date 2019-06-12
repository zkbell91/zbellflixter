class Course < ApplicationRecord
  belongs_to :user
  has_many :sections
  mount_uploader :image, ImageUploader
  has_many :enrollments

  validates :title, presence: true
  validates :description, presence: true
  validates :cost, numericality: {greater_than_or_equal_to: 0}
end
