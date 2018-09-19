require 'rails_helper'

RSpec.describe Mentor, type: :model do
  it { should have_one(:user) }
end
