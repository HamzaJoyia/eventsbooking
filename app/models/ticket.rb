class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :quantity, numericality: { greater_than: 0, message: "must be greater than 0" }
  validate :check_availability

  private

  
  def check_availability
    event.with_lock do
      if event.tickets_available.nil? || quantity.nil? || event.tickets_available < quantity
        errors.add(:base, "Not enough tickets available")
      end
    end
  end
end
