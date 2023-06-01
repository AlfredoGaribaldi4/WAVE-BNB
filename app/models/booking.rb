class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :reviews

  enum status: %i[pending confirmed declined]

  validate :cannot_book_own_board
  validates :date_check_in, :date_check_out, presence: true
  validate :not_past_check_in, :not_past_check_out
  validate :end_date_after_start_date

  private

  def cannot_book_own_board
    if board.user == user
      errors.add(:user_id, "cannot book his own surfboard")
    end
  end

  def not_past_check_in
    if date_check_in.past?
      errors.add(:date_check_in, 'cannot be in the past')
    end
  end

  def not_past_check_out
    if date_check_out.past?
      errors.add(:date_check_out, 'cannot be in the past')
    end
  end

  def end_date_after_start_date
    if date_check_out < date_check_in
      errors.add(:date_check_out, "must be after the start date")
    end
  end
end
