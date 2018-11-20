# frozen_string_literal: true

# == Schema Information
#
# Table name: checklists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  order      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  phase_id   :bigint(8)
#

require 'rails_helper'

describe Checklist, type: :model do
  describe 'associations' do
    it { should have_many(:tasks) }
    it { should have_many(:tags).through(:has_tags) }
    it { should belong_to(:phase) }
  end
end
