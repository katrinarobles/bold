class Occurence < ApplicationRecord
  belongs_to :course
  has_many :bookings, dependent: :destroy
  validates :course, presence: true
end
