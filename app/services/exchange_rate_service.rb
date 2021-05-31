class ExchangeRateService
  ENDPOINT = 'https://www.cbr-xml-daily.ru/daily_json.js'

  class << self
    #save all rate or only uniq
    def call
      create(current_rate)
    end

    def current_rate
      response = HTTParty.get(ENDPOINT)
      rates = JSON.parse(response, symbolize_names: true)

      rates[:Valute][:USD][:Value]
    end

    def create(rate)
      Rate.create!(value: rate.to_f)
    end
  end
end
