class CompanyPolicy < ApplicationPolicy
  def show?
    company_member?
  end

  private

  def company_member?
    user.client_info.company == record
  end
end
