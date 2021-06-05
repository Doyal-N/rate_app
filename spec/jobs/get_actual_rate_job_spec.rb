require 'rails_helper'

RSpec.describe GetActualRateJob, type: :job do
  describe '#perform_later' do
    it 'job was enqueued' do
      ActiveJob::Base.queue_adapter = :test

      GetActualRateJob.perform_later

      expect(GetActualRateJob).to have_been_enqueued
    end
  end
end
