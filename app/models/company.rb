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
  has_many :phases, dependent: :destroy
  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags
  has_many :clients, through: :client_infos, dependent: :destroy
  has_one :location, dependent: :destroy
  has_many :time_trackings
  belongs_to :mentor, optional: true

  after_create :make_phases

  accepts_nested_attributes_for :location

  def make_phases
    4.times { |i| phases.create(phase_number: i, status: 'inactive') }
  end
end
