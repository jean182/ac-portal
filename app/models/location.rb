# frozen_string_literal: true
class Location < ApplicationRecord
  belongs_to :admin, optional: :true
  belongs_to :company, optional: :true
end
