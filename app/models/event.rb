class Event < ApplicationRecord
  belongs_to :place
  has_many :tickets
  validate :start_date_cannot_be
  validates :place, uniqueness: { scope: :start_date,
                                 message: "One event in the place in one day" }

  def start_date_cannot_be
    if start_date < Date.today
      errors.add(:start_date, "can't be later than current date of creation.")
    end
  end



end
