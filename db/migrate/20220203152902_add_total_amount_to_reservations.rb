class AddTotalAmountToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_amount, :integer
    add_column :reservations, :total_day, :integer
  end
end
