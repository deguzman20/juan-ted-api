# == Schema Information
#
# Table name: billing_addresses
#
#  id               :bigint           not null, primary key
#  address_line_one :string(255)
#  address_line_two :string(255)
#  city             :string(255)
#  country          :string(255)
#  postal_code      :string(255)
#  state            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  customer_id      :integer
#
FactoryBot.define do
  factory :billing_address do
    address_line_one { "MyString" }
    address_line_two { "MyString" }
    city { "MyString" }
    state { "MyString" }
    postal_code { "MyString" }
    country { "MyString" }
  end
end
