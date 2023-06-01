class Board < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo
  
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, :price_per_day, :location, :photo, presence: true
end
