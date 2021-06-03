class SchedulerStore

  @@job = nil

  class << self
    def get_job
      @@job
    end

    def set_job(value)
      @@job = value
    end
  end
end
