class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :customer_id
      t.integer :tasker_id

      t.timestamps
    end
  end
end
