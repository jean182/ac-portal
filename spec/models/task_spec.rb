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

require 'rails_helper'

describe Task, type: :model do
  describe 'associations' do
    it { should have_many(:messages) }
    it { should belong_to(:checklist) }
  end
end
