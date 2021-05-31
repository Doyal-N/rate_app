class GetActualRateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ExchangeRateService.call
  end
end
