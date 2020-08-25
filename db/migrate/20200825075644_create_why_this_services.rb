class CreateWhyThisServices < ActiveRecord::Migration[5.2]
  def change
    create_table :why_this_services do |t|
      t.integer :service_id
      t.string :reason

      t.timestamps
    end
  end
end
