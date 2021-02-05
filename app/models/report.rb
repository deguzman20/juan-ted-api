# == Schema Information
#
# Table name: reports
#
#  id           :bigint           not null, primary key
#  image        :string(255)
#  valid_report :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  customer_id  :integer
#  tasker_id    :integer
#
class Report < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :tasker, optional: true

  mount_base64_uploader :image, ReportUploader

  after_update_commit :update_report_count

  def update_report_count
    case self.valid_report
    when true then report(tasker.id)
    end
  end

  def report(tasker_id)
    @tasker = Tasker.find(tasker_id)
    @tasker.report_count += 1
    @tasker.suspended = @tasker.report_count % 3 == 0 ? true : false
    @tasker.save
  end
end
