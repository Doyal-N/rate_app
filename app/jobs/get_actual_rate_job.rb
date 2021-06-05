# frozen_string_literal: true

class GetActualRateJob < ApplicationJob
  queue_as :default

  def perform
    ExchangeRateService.call
  end
end
