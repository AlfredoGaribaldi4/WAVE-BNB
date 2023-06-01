class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :reviews

  enum status: %i[pending confirmed declined]

  validates :date_check_in, :date_check_out, presence: true
  validate :user_cannot_book_own_product

  def user_cannot_book_own_product
    if user && board.user == user
      errors.add(:user, "cannot book their own product")
    end
  end
end
