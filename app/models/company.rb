class Company < ApplicationRecord
  has_many :phases, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_one :location, dependent: :destroy

  alias_attribute :owner, :client
  alias_attribute :team_members, :client

  has_one :owner, dependent: :destroy
  has_many :team_members, dependent: :destroy
  has_many :time_trackings
  belongs_to :mentor
end
