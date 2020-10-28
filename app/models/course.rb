class Course < ApplicationRecord
  belongs_to :user
  has_many :occurences, dependent: :destroy
  has_many :bookings, through: :occurences
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :location, presence: true

  validates_associated :occurences
  validates :user, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
