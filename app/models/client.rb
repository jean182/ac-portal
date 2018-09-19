class Client < ApplicationRecord
  has_one :user, dependent: :destroy, as: :account

  has_many :time_trackings
  has_many :phases, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_one :location, dependent: :destroy



  accepts_nested_attributes_for :user
end
