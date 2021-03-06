# == Schema Information
#
# Table name: company_tasks
#
#  id         :bigint(8)        not null, primary key
#  approved   :boolean
#  complete   :boolean
#  company_id :bigint(8)
#  task_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CompanyTask < ApplicationRecord
  has_many :logs, as: :loggable
  has_many :messages
  belongs_to :company
  belongs_to :task

  def mentors
    task.checklist.mentors
  end
end
