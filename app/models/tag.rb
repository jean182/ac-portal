# frozen_string_literal: true
class Tag < ApplicationRecord
  belongs_to :checklist, optional: true
  belongs_to :client, optional: true
end
