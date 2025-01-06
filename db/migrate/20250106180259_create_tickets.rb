class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.integer :number_of_tickets

      t.timestamps
    end
  end
end

