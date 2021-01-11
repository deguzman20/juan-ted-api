# == Schema Information
#
# Table name: billing_addresses
#
#  id               :bigint           not null, primary key
#  address_line_one :string(255)
#  address_line_two :string(255)
#  city             :string(255)
#  country          :string(255)
#  email            :string(255)
#  first_name       :string(255)
#  last_name        :string(255)
#  mobile_number    :string(255)
#  postal_code      :string(255)
#  state            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  customer_id      :integer
#
require 'rails_helper'

RSpec.describe BillingAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
