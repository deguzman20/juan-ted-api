# == Schema Information
#
# Table name: customers
#
#  id                     :bigint           not null, primary key
#  auth_token             :string
#  card_detail            :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  formatted_address      :string
#  image                  :string
#  last_name              :string
#  lat                    :decimal(10, 6)
#  lng                    :decimal(10, 6)
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
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#
require "rails_helper"

RSpec.describe Customer, type: :model do
  it { is_expected.to have_many(:tasks) }
  it { is_expected.to have_many(:todos) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:conversations) }
  it { is_expected.to have_many(:transactions) }
end
