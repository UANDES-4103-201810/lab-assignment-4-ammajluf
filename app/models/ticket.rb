class Ticket < ApplicationRecord
  belongs_to :event
  has_many :user_tickets
  has_many :users, through: :user_tickets

  validates :price, numericality: { greater_than: 0 }
  validate :ticket_cannot_be_created_after_start_date_event

  def ticket_cannot_be_created_after_start_date_event
    if event.start_date < Date.today
      errors.add(event.start_date, "ticket cannot be created after the start date of the event.")
    end
  end
end
