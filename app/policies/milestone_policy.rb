class MilestonePolicy < ApplicationPolicy
  def mark_complete?
    company_member?
  end

  def mark_incomplete?
    company_member?
  end

  private

  def company_member?
    user.client_info.company == record.company_phase&.company
  end
end
