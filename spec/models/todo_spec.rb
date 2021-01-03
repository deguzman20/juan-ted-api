# == Schema Information
#
# Table name: todos
#
#  id               :bigint           not null, primary key
#  todo_description :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  customer_id      :integer
#  service_id       :integer
#
require "rails_helper"

RSpec.describe Todo, type: :model do
  it { is_expected.to belong_to(:customer).optional(true) }
  it { is_expected.to belong_to(:service).optional(true) }
end
