# == Schema Information
#
# Table name: service_types
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe ServiceType, type: :model do
  it { is_expected.to have_many(:services) }
  it { is_expected.to have_many(:featured_skills) }
  it { is_expected.to have_many(:reviews) }
end
