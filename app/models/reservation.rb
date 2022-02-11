class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room


  validates :people, numericality: true
  with_options presence: true do
    validates :start_date
    validates :end_date
  end

  def days
    self.total_day = (self.end_date - self.start_date).to_i
  end

  def amount
    self.total_amount = self.room.room_price.to_i * self.people.to_i * self.total_day
  end
end
