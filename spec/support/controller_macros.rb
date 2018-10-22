module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:admin)
      sign_in admin
    end
  end

  def login_mentor
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:mentor]
      mentor = FactoryBot.create(:mentor)
      sign_in mentor
    end
  end

  def login_client
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:client]
      client = FactoryBot.create(:client)
      client.client_info.update_attributes(company_id: FactoryBot.create(:company).id)
      sign_in client
    end
  end
end
