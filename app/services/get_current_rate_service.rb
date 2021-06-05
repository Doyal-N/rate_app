# frozen_string_literal: true

module GetCurrentRateService
  def self.value_for_broadcast
    forced_rate = ForcedRate.last

    if forced_rate.present? && forced_rate.show_until > Time.current
      forced_rate.rate
    else
      Rate.last&.value
    end
  end
end
