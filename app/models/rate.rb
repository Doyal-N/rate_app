class Rate < ApplicationRecord
  CURRENT_FORMAT = /\A\d{2}(.\d{0,3})?\z/.freeze

  validates :value, presence: true, numericality: true, format: { with: CURRENT_FORMAT  }
end
