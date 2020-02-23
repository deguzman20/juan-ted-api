# == Schema Information
#
# Table name: featured_skills
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#  tasker_id  :integer
#
require "rails_helper"

RSpec.describe FeaturedSkill, type: :model do
  it { is_expected.to belong_to(:tasker) }
  it { is_expected.to belong_to(:service) }
end
