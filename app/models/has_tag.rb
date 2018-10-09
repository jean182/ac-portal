# == Schema Information
#
# Table name: has_tags
#
#  id           :bigint(8)        not null, primary key
#  checklist_id :bigint(8)
#  tag_id       :bigint(8)
#  company_id   :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mentor_id    :bigint(8)
#

class HasTag < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :checklist, optional: true
  belongs_to :mentor, optional: true
  belongs_to :tag
end
