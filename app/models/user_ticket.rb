class UserTicket < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validate :ticket_cannot_be_bought_after_start_date_event

  def ticket_cannot_be_bought_after_start_date_event
    if ticket.event.start_date < time
      errors.add(time, "ticket cannot be bought after the start date of the event.")
    end
  end
end
