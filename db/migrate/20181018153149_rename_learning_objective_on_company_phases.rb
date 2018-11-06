class RenameLearningObjectiveOnCompanyPhases < ActiveRecord::Migration[5.2]
  def change
    rename_column :company_phases, :learning_objective, :learning_objectives
  end
end
