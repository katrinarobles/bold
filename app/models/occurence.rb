class Occurence < ApplicationRecord
  belongs_to :course
  has_many :bookings, dependent: :destroy

  validates :date, presence: true
  validates :capacity, presence: true

  validates_associated :bookings
  validates :course, presence: true
end
