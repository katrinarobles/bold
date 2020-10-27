class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :occurence
  validates :occurence, presence: true
end
