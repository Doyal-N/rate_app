# frozen_string_literal: true

class SchedulerStore
  def self.sheduler
    @@job
  end

  def self.app_sheduler(value)
    @@job = value
  end
end
