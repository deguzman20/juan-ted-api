class CreateTransactionServices < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_services do |t|
      t.integer :transaction_id
      t.integer :service_id
      t.integer :quantity

      t.timestamps
    end
  end
end
