class Client < ApplicationRecord
  has_one :user, dependent: :destroy, as: :account
  has_many :time_trackings
  accepts_nested_attributes_for :user
end
