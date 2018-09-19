# frozen_string_literal: true
class Task < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :checklist
end
