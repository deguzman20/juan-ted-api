class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :service_id
      t.integer :customer_id
      t.string :todo_description

      t.timestamps
    end
  end
end
