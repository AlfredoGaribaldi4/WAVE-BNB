class Board < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :title, :price_per_day, :location, presence: true
end
