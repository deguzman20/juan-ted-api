class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :tasker_id 
      t.integer :customer_id
      t.integer :service_type_id
      t.integer :shipping_address_id
      t.integer :billing_address_id
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.string :formatted_address
      t.boolean :approved, default: false
      t.boolean :done, default: false
      t.datetime :from
      t.datetime :to
      t.boolean :favorate, default: false
      t.boolean :review, default: :false
      t.boolean :paid, default: :false
      # t.datetime :start_to
      t.timestamps
    end
  end
end
