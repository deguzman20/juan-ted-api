class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :customer_id
      t.integer :tasker_id
      t.boolean :valid_report, default: false
      
      t.string :image
      t.string :reason

      t.timestamps
    end
  end
end
