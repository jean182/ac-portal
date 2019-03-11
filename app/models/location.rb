# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  address_line1 :string
#  address_line2 :string
#  postal_code   :string
#  city          :string
#  state         :string
#  country       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  admin_id      :bigint(8)
#  company_id    :bigint(8)
#

class Location < ApplicationRecord
  belongs_to :admin, optional: :true
  belongs_to :company, optional: :true

  validates :address_line1, :city,
            :country, :postal_code, :state, presence: true
  validate :subregion_belongs_to_country

  def subregion_belongs_to_country
    if country.present? && state.present? &&
       Carmen::Country.coded(country).subregions.select { |s| state.include?(s.code) }.present? == false
      errors.add(:state, "must be of the same country")
    end
  end
end
