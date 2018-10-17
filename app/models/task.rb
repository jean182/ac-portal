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
  has_many :messages, dependent: :destroy
  has_many :company_tasks
  belongs_to :checklist
end
