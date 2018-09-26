class HasTag < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :checklist, optional: true
  belongs_to :mentor, optional: true
  belongs_to :tag
end
