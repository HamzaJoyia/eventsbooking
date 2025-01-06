class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy

  validates :name, :description, :location, :date, :tickets_total, presence: true
  validates :tickets_total, numericality: { greater_than: 0 }

  before_create :set_tickets_available

  private

  def set_tickets_available
    self.tickets_available ||= tickets_total # Set to tickets_total if nil
  end
end
