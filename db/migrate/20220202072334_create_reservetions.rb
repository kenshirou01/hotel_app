class CreateReservetions < ActiveRecord::Migration[6.1]
  def change
    create_table :reservetions do |t|
      t.integer :user_id
      t.integer :room_id
      t.string  :people
      t.date    :start_date
      t.date    :end_date
      t.timestamps
    end
  end
end
