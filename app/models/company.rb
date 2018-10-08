class Company < ApplicationRecord
  has_many :phases, dependent: :destroy
  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags
  has_many :clients
  has_one :location, dependent: :destroy

  # alias_attribute :owner, :client
  # alias_attribute :team_members, :client

  # has_one :owner, dependent: :destroy
  # has_many :team_members, dependent: :destroy
  has_many :time_trackings
  belongs_to :mentor, optional: true
  after_create :make_phases
  accepts_nested_attributes_for :location

  def make_phases
    4.times { |i| phases.create(phase_number: i, status: 'inactive') }
  end
end
