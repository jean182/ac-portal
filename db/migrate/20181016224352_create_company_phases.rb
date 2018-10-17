class CreateCompanyPhases < ActiveRecord::Migration[5.2]
  def change
    create_table :company_phases do |t|
      t.text :learning_objective
      t.belongs_to :company, index: true
      t.belongs_to :phase, index: true

      t.timestamps
    end
  end
end
