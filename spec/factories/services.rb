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
FactoryBot.define do
  factory :service do
    type { "" }
  end
end
