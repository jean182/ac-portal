require 'rails_helper'

describe Admin::ClientsController, type: :controller do
  login_admin

  describe "POST #create" do
    let(:client_params) { { client: { name: Faker::Name.unique.name, email: Faker::Internet.unique.email } } }

    it "creates a client" do
      expect { post :create, params: client_params }.to change { Client.count }.by(1)
    end

    it "sends an email invitation" do
      expect { post :create, params: client_params }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
