class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.text :text
      t.boolean :own_by_customer
      t.string :created_date

      t.timestamps
    end
  end
end
