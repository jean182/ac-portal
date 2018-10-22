# frozen_string_literal: true
# == Schema Information
#
# Table name: messages
#
#  id              :bigint(8)        not null, primary key
#  text            :string
#  date            :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_task_id :bigint(8)
#

class Message < ApplicationRecord
  belongs_to :company_task
end
