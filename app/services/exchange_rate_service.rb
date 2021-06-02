class ExchangeRateService
  extend AfterCommitEverywhere

  ENDPOINT = 'https://www.cbr-xml-daily.ru/daily_json.js'

  class << self
    #save all rate or only uniq
    def call
      Rate.transaction do
        create(current_rate)
        after_commit { broadcast_rate }
      end
    end

    private

    def current_rate
      response = HTTParty.get(ENDPOINT)
      rates = JSON.parse(response, symbolize_names: true)

      rates[:Valute][:USD][:Value]
    end

    def create(rate)
      Rate.find_or_create_by(value: rate.to_f)
    end

    def broadcast_rate
      ActionCable.server.broadcast('rate_channel', Rate.value_for_broadcast)
    end
  end
end
