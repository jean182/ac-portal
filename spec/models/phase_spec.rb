# frozen_string_literal: true
require 'rails_helper'

describe Phase, type: :model do
  describe 'associations' do
    it { should have_many(:checklists) }
    it { should have_many(:milestones) }
  end
end
