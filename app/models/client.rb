class Client < ApplicationRecord
  has_one :user, dependent: :destroy, as: :account
  accepts_nested_attributes_for :user
end
