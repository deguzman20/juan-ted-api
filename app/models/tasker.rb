# == Schema Information
#
# Table name: taskers
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  hourly_rate            :float(24)
#  image                  :string(255)
#  introduction           :text(65535)
#  last_name              :string(255)
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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :customers, through: :tasks

  has_many :featured_skills
  has_many :services, through: :featured_skills

  has_many :reviews
  has_many :customers, through: :reviews
end
