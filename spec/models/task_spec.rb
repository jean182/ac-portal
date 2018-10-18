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

require 'rails_helper'

describe Task, type: :model do
  describe 'associations' do
    it { should have_many(:messages) }
    it { should belong_to(:checklist) }
  end
end
