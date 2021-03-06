class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :phase
      t.datetime :reserved_at
      t.datetime :confirmed_at
      t.datetime :cancelled_at
      t.datetime :scheduled_to
      t.integer :requested_seats
      t.datetime :started_at
      t.datetime :ended_at
      t.float :price
      t.references :vehicle, index: true, foreign_key: true
      t.references :service_type, index: true, foreign_key: true
      t.references :payment_type, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
