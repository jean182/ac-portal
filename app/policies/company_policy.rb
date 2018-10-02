class CompanyPolicy < ApplicationPolicy
  def show?
    user.present? && user.client? && user.account.company == company
  end

  private

  def company
    record
  end
end
