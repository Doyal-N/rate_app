# require 'rufus/scheduler'
# require "#{Rails.root}/app/lib/sheduler_store"

# # #maybe every 1h
# sheduler = Rufus::Scheduler.new

# SchedulerStore.set_job(sheduler)

# sheduler.every '2m', :first => :now do
#   GetActualRateJob.perform_later
# end
