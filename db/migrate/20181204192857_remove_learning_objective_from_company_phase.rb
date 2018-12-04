class RemoveLearningObjectiveFromCompanyPhase < ActiveRecord::Migration[5.2]
  def up
    add_column :phases, :learning_objectives, :text
    remove_column :company_phases, :learning_objectives
  end

  def down
    remove_column :phases, :learning_objectives
    add_column :company_phases, :learning_objectives, :text
  end
end
