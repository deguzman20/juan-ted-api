class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :tasker_id
      t.integer :customer_id
      t.integer :estimated_task_id
      t.string :start_location_address
      t.string :end_location_address
      t.boolean :approved, default: false
      t.boolean :task_completed, default: false

      t.timestamps
    end
  end
end
