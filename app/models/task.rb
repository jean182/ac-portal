# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id           :bigint(8)        not null, primary key
#  description  :string
#  is_complete  :boolean
#  score        :decimal(, )
#  is_approved  :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checklist_id :bigint(8)
#

class Task < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :checklist
end
