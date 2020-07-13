# == Schema Information
#
# Table name: keywords
#
#  id         :bigint           not null, primary key
#  keyword    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#
require "rails_helper"

RSpec.describe Keyword, type: :model do
  it { is_expected.to belong_to(:service) }
end
