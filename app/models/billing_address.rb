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
#
class BillingAddress < ApplicationRecord
  has_many :transactions
end
