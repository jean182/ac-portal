class RemoveLearningObjectiveFromPhases < ActiveRecord::Migration[5.2]
  def change
    remove_column :phases, :learning_objective, :string
  end
end
