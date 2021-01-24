class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :customer_id
      t.integer :tasker_id
      t.string :image

      t.timestamps
    end
  end
end
