class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.string :image
      t.float :price
      t.integer :service_type_id

      t.timestamps
    end
  end
end
