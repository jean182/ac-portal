class AddCompanyAssocciations < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :mentor, foreign_key: true, dependent: :destroy    
    add_reference :time_trackings, :company, foreign_key: true, dependent: :destroy    
    add_reference :locations, :company, foreign_key: true, dependent: :destroy
    add_reference :phases, :company, foreign_key: true, dependent: :destroy
    add_reference :tags, :company, foreign_key: true, dependent: :destroy
  end
end
