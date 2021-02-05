# == Schema Information
#
# Table name: taskers
#
#  id                     :bigint           not null, primary key
#  auth_token             :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  formatted_address      :string(255)
#  hourly_rate            :float(24)
#  image                  :string(255)
#  introduction           :text(65535)
#  last_name              :string(255)
#  lat                    :decimal(10, 6)
#  lng                    :decimal(10, 6)
#  mobile_number          :string(255)
#  remember_created_at    :datetime
#  report_count           :integer          default(0)
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  suspended              :boolean          default(FALSE)
#  zip_code               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_taskers_on_email                 (email) UNIQUE
#  index_taskers_on_reset_password_token  (reset_password_token) UNIQUE
#
require "rails_helper"

RSpec.describe Tasker, type: :model do
  it { is_expected.to have_many(:tasks) }
  # it { is_expected.to have_many(:customers).through(:tasks) }
  it { is_expected.to have_many(:featured_skills) }
  # it { is_expected.to have_many(:service_types).through(:featured_skills) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:conversations) }
  it { is_expected.to have_many(:transactions) }
  # it { is_expected.to have_many(:customers).through(:reviews) }
end
