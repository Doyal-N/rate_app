require 'rufus/scheduler'
require 'tzinfo/data'
require "#{Rails.root}/app/lib/sheduler_store"

new_sheduler = Rufus::Scheduler.new

SchedulerStore.app_sheduler(new_sheduler)

#:first => :now - as a valid option
new_sheduler.every '2h' do
  GetActualRateJob.perform_later
end
