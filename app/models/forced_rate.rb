# frozen_string_literal: true

class ForcedRate < ApplicationRecord
  validates :rate, :show_until, presence: true
  validates :rate, numericality: { greater_than: 0 }
end
