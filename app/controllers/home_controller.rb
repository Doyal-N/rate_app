# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    ExchangeRateService.call
  end
end
