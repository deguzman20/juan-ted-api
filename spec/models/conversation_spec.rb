# == Schema Information
#
# Table name: conversations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  tasker_id   :integer
#
require "rails_helper"

RSpec.describe Conversation, type: :model do
  it { is_expected.to belong_to(:customer).optional(:true) }
  it { is_expected.to belong_to(:tasker).optional(:true) }
  it { is_expected.to have_many(:messages) }
end
