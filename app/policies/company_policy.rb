class CompanyPolicy < ApplicationPolicy
  def show?
    user.present? && user.client? && user.client_info.company == company
  end

  private

  def company
    record
  end
end
