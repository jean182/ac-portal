class ClientsController < ApplicationController
  before_action :set_client
  def index
    @clients = policy_scope(Client)
  end

  private

  def set_client
    @client = current_user.account if current_user.present?
    authorize(@client)
  end
end
