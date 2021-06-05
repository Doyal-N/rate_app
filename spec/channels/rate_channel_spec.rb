# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RateChannel, type: :channel do
  before do
    stub_connection
  end

  it 'subscribes to a stream' do
    subscribe

    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from('rate_channel')
  end
end
