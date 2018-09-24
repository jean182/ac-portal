class HasTag < ApplicationRecord
  belongs_to :company
  belongs_to :checklist
  belongs_to :tag
end
