class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.float :ratings
      t.text :comments
      t.integer :customer_id
      t.integer :tasker_id
      t.integer :service_id

      t.timestamps
    end
  end
end
