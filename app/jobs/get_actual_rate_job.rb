class GetActualRateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ExchangeRateService.call
    SchedulerStore.get_extra_job.shutdown if SchedulerStore.get_extra_job.present?
  end
end
