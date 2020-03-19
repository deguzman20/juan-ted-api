class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :tasker_id
      t.integer :customer_id
      t.string :start_location_address
      t.string :end_location_address
      t.string :street_address
      t.string :unit_or_apt_no
      t.boolean :approved, default: false
      t.boolean :task_completed, default: false
      t.float :latitude
      t.float :longitude
      t.datetime :date_of_shedule
      t.integer :number_of_hours
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
