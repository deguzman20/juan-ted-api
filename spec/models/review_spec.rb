# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  comment     :text(65535)
#  rating      :float(24)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  service_id  :integer
#  tasker_id   :integer
#
require "rails_helper"

RSpec.describe Review, type: :model do
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to belong_to(:tasker) }
  it { is_expected.to belong_to(:service) }
end
