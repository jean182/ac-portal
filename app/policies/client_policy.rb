class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.where(company_id: user.account.company_id) if user.client? && user.present?
    end
  end

  def index?
    true if user&.client? && user.present?
  end

  private

  def client
    record
  end
end
