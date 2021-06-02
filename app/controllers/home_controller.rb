class HomeController < ApplicationController
  def index
    ExchangeRateService.call
  end
end
