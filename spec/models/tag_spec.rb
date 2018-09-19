# frozen_string_literal: true
require 'rails_helper'

describe Tag, type: :model do
  describe 'associations' do
    it { should have_many(:tasks) }
    it { should have_many(:tags) }
  end
end
