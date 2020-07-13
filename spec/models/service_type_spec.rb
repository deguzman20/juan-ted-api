# == Schema Information
#
# Table name: service_types
#
#  id         :bigint           not null, primary key
#  image      :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe ServiceType, type: :model do
  it { is_expected.to have_many(:services) }
  it { is_expected.to have_many(:featured_skills) }
end
