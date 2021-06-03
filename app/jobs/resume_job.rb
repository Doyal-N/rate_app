class ResumeJob < ApplicationJob
  queue_as :default

  def perform(time_limit)
    sheduler = SchedulerStore.get_job
    sheduler.pause unless sheduler.paused?

    Rufus::Scheduler.new.at time_limit do
      sheduler.resume if sheduler.paused?
    end
  end
end
