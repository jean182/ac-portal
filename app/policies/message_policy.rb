class MessagePolicy < ApplicationPolicy

  def create?
    user.admin? || user.mentor? || company_member?
  end

  private

  def company_member?
    user.client_info.company == record.company_task.company if user.client?
  end
end
