class SchedulerStore

  @@job = nil
  @@extra_job = nil

  class << self
    def get_job
      @@job
    end

    def set_job(value)
      @@job = value
    end

    def get_extra_job
      @@extra_job
    end

    def set_extra_job(value)
      @@extra_job = value
    end
  end
end
