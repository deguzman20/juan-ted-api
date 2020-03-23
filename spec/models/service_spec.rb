# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Service, type: :model do
  it { is_expected.to have_many(:featured_skills) }
  it { is_expected.to have_many(:taskers).through(:featured_skills) }
  it { is_expected.to have_many(:reviews) }
end
