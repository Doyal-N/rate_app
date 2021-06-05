require 'rails_helper'

RSpec.describe ResumeJob, type: :job do
  describe '#perform_later' do
    let(:forced_rate) { create(:forced_rate) }

    it 'job was enqueued' do
      ActiveJob::Base.queue_adapter = :test

      ResumeJob.perform_later(forced_rate.show_until)

      expect(ResumeJob).to have_been_enqueued
    end
  end
end
