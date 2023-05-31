class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :reviews

  enum status: %i[pending confirmed declined]

  validates :date_check_in, :date_check_out, presence: true
end
