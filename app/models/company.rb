# == Schema Information
#
# Table name: companies
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  logo        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  mentor_id   :bigint(8)
#  phone       :string
#

class Company < ApplicationRecord
  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags
  has_many :client_infos
  has_many :clients, through: :client_infos, dependent: :destroy
  has_many :company_phases
  has_many :phases, through: :company_phases
  has_one :location, dependent: :destroy
  has_many :time_trackings
  has_many :company_tasks
  belongs_to :mentor, optional: true

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :company_phases, reject_if: :all_blank, allow_destroy: true
end
