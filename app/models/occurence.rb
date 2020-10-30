class Occurence < ApplicationRecord
  belongs_to :course
  has_many :bookings, dependent: :destroy

  validates :date, presence: true
  validates :capacity, presence: true
  validates :location, presence: true

  validates_associated :bookings
  validates :course, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def slot
    "#{date}"
  end
end
