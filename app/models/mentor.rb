class Mentor < ApplicationRecord
  has_one :user, dependent: :destroy, as: :account
  accepts_nested_attributes_for :user
  has_many :time_trackings
  has_many :companies
  has_many :has_tags, dependent: :destroy
  has_many :tags, through: :has_tags
end
