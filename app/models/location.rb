# frozen_string_literal: true
class Location < ApplicationRecord
  belongs_to :admin, optional: :true
  belongs_to :company, optional: :true
  validates :address_line1, :address_line2, :city,
            :country, :postal_code, :state, presence: true
end
