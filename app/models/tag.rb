# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_type   :integer
#

class Tag < ApplicationRecord
  belongs_to :checklist, optional: true
  belongs_to :company, optional: true
  has_many :has_tags, dependent: :destroy

  enum tag_type: [:industry, :expertise]

  validates :name, uniqueness: true, presence: true
  validates :tag_type, presence: true
end
