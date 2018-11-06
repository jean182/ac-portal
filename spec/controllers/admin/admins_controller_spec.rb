require 'rails_helper'

describe Admin::AdminsController, type: :controller do
  login_admin

  describe "POST #create" do
    let(:admin_params) { { admin: { name: Faker::Name.unique.name, email: Faker::Internet.unique.email } } }

    it "creates an admin" do
      expect { post :create, params: admin_params }.to change { Admin.count }.by(1)
    end

    it "sends an email invitation" do
      expect { post :create, params: admin_params }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
