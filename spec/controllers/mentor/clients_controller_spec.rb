require 'rails_helper'

describe Member::ClientsController, type: :controller do
  login_client
  let(:client) { subject.current_user }

  before do
    create(:client_info, client: client, company: create(:company))
  end

  describe "POST #create" do
    let(:client_params) { { client: { name: Faker::Name.unique.name, email: Faker::Internet.unique.email } } }

    it "creates a client" do
      expect { post :create, params: client_params }.to change { Client.count }.by(1)
    end

    it "sends an email invitation" do
      expect { post :create, params: client_params }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "sets the new client company" do
      post :create, params: client_params
      expect(Client.last.client_info.company).to eq(client.client_info.company)
    end
  end
end
