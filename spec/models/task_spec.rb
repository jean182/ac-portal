# frozen_string_literal: true
require 'rails_helper'

describe Task, type: :model do
  describe 'associations' do
    it { should have_many(:messages) }
  end
end
