class CreateEquipmentUses < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment_uses do |t|
      t.integer :service_id
      t.string :text
      

      t.timestamps
    end
  end
end
