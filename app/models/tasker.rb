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
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  zip_code               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_taskers_on_email                 (email) UNIQUE
#  index_taskers_on_reset_password_token  (reset_password_token) UNIQUE
#
class Tasker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :full_street_address
  reverse_geocoded_by :lat, :lng

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :customers, through: :tasks

  has_many :featured_skills
  has_many :service_types, through: :featured_skills

  has_many :reviews
  has_many :customers, through: :reviews

  has_many :conversations
  has_many :customers, through: :conversations

  has_many :transactions
  has_many :customers, through: :transactions

  has_many :notifications

  mount_base64_uploader :image, TaskerUploader
end
