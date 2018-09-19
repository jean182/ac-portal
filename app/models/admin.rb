class Admin < ApplicationRecord
  has_one :user, dependent: :destroy, as: :account
  has_one :location, dependent: :destroy
  accepts_nested_attributes_for :user
end
