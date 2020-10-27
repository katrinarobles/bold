class Course < ApplicationRecord
  belongs_to :user
  has_many :occurences, dependent: :destroy
end
