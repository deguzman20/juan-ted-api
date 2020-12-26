# == Schema Information
#
# Table name: services
#
#  id              :bigint           not null, primary key
#  description     :text
#  image           :string
#  name            :string
#  price           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  service_type_id :integer
#
require "rails_helper"

RSpec.describe Service, type: :model do
  it { is_expected.to belong_to(:service_type).optional(true) }
  it { is_expected.to have_many(:keywords).dependent(:destroy) }
  it { is_expected.to have_many(:transaction_services) }
end
