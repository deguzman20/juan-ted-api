# == Schema Information
#
# Table name: services
#
#  id              :bigint           not null, primary key
#  description     :text(65535)
#  image           :string(255)
#  name            :string(255)
#  price           :float(24)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  service_type_id :integer
#
require "rails_helper"

RSpec.describe Service, type: :model do
  # it { is_expected.to have_many(:featured_skills) }
  # it { is_expected.to have_many(:taskers).through(:featured_skills) }
  it { is_expected.to have_many(:reviews).dependent(:destroy) }
end
