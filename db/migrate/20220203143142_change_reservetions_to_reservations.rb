class ChangeReservetionsToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_table :reservetions, :reservations
  end
end
