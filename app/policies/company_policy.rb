class CompanyPolicy < ApplicationPolicy
  def show?
    return true if user.present? && user.client? && user.account.company == company
  end

  private

  def company
    record
  end
end
