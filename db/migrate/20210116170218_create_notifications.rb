class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :customer_id
      t.integer :tasker_id
      t.string :text
      t.string :created_date

      t.timestamps
    end
  end
end
