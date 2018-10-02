class Client < ApplicationRecord
  has_one :user, dependent: :destroy, as: :account
  has_many :time_trackings
  belongs_to :company
  accepts_nested_attributes_for :user
end
