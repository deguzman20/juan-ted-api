class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.integer :service_id
      t.string :keyword

      t.timestamps
    end
  end
end
