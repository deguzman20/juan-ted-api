# == Schema Information
#
# Table name: taskers
#
#  id                     :bigint           not null, primary key
#  auth_token             :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  hourly_rate            :float
#  image                  :string
#  introduction           :text
#  last_name              :string
#  mobile_number          :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  zip_code               :string
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
  it { is_expected.to have_many(:services).through(:featured_skills) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:customers).through(:reviews) }
end
