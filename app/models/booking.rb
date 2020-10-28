class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :occurence
  has_one :course, through: :occurence
  validates :occurence, presence: true
  validates :user, presence: true
end
