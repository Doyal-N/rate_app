class Rate < ApplicationRecord
  validates :value, presence: true, numericality: { greater_than: 0 }

  def self.value_for_broadcast
    forced_rate = ForcedRate.last

    if forced_rate.present? && forced_rate.show_until > Time.current
      forced_rate.rate
    else
      last&.value
    end
  end
end
