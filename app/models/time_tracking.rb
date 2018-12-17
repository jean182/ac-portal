# == Schema Information
#
# Table name: time_trackings
#
#  id          :bigint(8)        not null, primary key
#  date        :date
#  hours_spent :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mentor_id   :bigint(8)
#  company_id  :bigint(8)
#  notes       :text
#

class TimeTracking < ApplicationRecord
  MONTHLY_QUOTA = 5
  belongs_to :mentor
  belongs_to :company

  default_scope { order('date DESC') }

  after_create :check_quota_exceeded

  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |time|
        csv << [time.date, time.hours_spent, time.company.name, time.mentor.email, time.notes]
      end
    end
  end

  private

  def check_quota_exceeded
    total_time = 0
    company.time_trackings.each do |time_tracking|
      total_time += time_tracking.hours_spent if time_tracking.date.month == date.month
      break if total_time > MONTHLY_QUOTA
    end
    if total_time > MONTHLY_QUOTA
      Admin.find_each do |admin|
        NotificationMailer.quota_exceeded_notification(admin, company, date.strftime("%B")).deliver_later
      end
    end
  end
end
