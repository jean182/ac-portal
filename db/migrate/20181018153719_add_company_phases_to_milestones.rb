class AddCompanyPhasesToMilestones < ActiveRecord::Migration[5.2]
  def change
    remove_reference :milestones, :phase
    add_reference :milestones, :company_phase, foreign_key: true, dependent: :destroy
  end
end
