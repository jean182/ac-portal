# frozen_string_literal: true
# == Schema Information
#
# Table name: tasks
#
#  id           :bigint(8)        not null, primary key
#  description  :string
#  score        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint(8)
#

class Task < ApplicationRecord
  has_many :company_tasks
  has_many :companies, through: :company_tasks
  belongs_to :checklist

  def completed_by_company?(company_id)
    company_task = company_tasks.find_by(company_id: company_id)
    if company_task.present?
      company_task.complete
    else
      false
    end
  end
end
