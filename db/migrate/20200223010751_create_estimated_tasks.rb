class CreateEstimatedTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :estimated_tasks do |t|
      t.string :name

      t.timestamps
    end
  end
end
