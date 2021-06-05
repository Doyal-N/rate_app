# frozen_string_literal: true

class ResumeJob < ApplicationJob
  queue_as :default

  def perform(time_limit)
    time_manager = SchedulerStore.sheduler
    time_manager.pause unless time_manager.paused?

    Rufus::Scheduler.new.at time_limit do
      time_manager.resume if time_manager.paused?
    end
  end
end
