require 'rufus/scheduler'

#maybe every 1h
Rufus::Scheduler.singleton.every '3m' do
  GetActualRateJob.perform_later
end
