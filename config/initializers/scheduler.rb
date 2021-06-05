require 'rufus/scheduler'
require 'tzinfo/data'
require "#{Rails.root}/app/lib/sheduler_store"

sheduler = Rufus::Scheduler.new

SchedulerStore.set_job(sheduler)

#:first => :now - as a valid option
sheduler.every '4h' do
  GetActualRateJob.perform_later
end
