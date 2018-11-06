require 'rails_helper'

describe Admin::MentorsController, type: :controller do
  login_admin

  describe "POST #create" do
    let(:mentor_params) { { mentor: { name: Faker::Name.unique.name, email: Faker::Internet.unique.email } } }

    it "creates a mentor" do
      expect { post :create, params: mentor_params }.to change { Mentor.count }.by(1)
    end

    it "sends an email invitation" do
      expect { post :create, params: mentor_params }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
