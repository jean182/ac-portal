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

  validates :address_line1, :address_line2, :city,
            :country, :postal_code, :state, presence: true
end
