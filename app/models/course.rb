class Course < ApplicationRecord
  belongs_to :user
  has_many :occurences, dependent: :destroy
  has_many :bookings, through: :occurences
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }

  has_one_attached :photo
  validates_associated :occurences
  validates :user, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name],
    associated_against: {
      occurences: [ :date, :location ]
    },
    using: {
      tsearch: { prefix: true } # allows searches like 'yogam'
    }

    def todays_occurences
      todays_occurences = []
      self.occurences.each do |occurence|
        if occurence.date.split.first == Date.today.to_s
          todays_occurences.push(occurence)
        end
      end
      return todays_occurences
    end
end
