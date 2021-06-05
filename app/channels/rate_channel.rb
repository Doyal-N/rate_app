# frozen_string_literal: true

class RateChannel < ApplicationCable::Channel
  def subscribed
    logger.info 'клиент подписан'
    stream_from 'rate_channel'
  end

  def unsubscribed
    logger.info 'клиент отписан'
  end
end
