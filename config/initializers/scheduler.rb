require 'rufus/scheduler'
require "#{Rails.root}/app/lib/sheduler_store"

sheduler = Rufus::Scheduler.new

SchedulerStore.set_job(sheduler)

sheduler.every '2h', :first => :now do
  GetActualRateJob.perform_later
end
