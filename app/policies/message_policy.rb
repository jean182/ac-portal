class MessagePolicy < ApplicationPolicy

  def create?
    user.admin? || user.mentor? || company_member?
  end

  def destroy?
    user.admin? || record.user == user
  end

  private

  def company_member?
    user.client_info.company == record.company_task.company if user.client?
  end
end
