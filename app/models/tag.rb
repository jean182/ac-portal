# frozen_string_literal: true
class Tag < ApplicationRecord
  belongs_to :checklist, optional: true
  belongs_to :company, optional: true
end
