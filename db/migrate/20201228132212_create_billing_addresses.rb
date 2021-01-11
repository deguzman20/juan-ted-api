class CreateBillingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :billing_addresses do |t|
      t.integer :customer_id
      t.string :first_name
      t.string :last_name
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :email
      t.string :mobile_number

      t.timestamps
    end
  end
end
