class RateChannel < ApplicationCable::Channel
  def subscribed
    logger.info 'клиент подписан'
    stream_from 'rate_channel'
    send_rate
  end

  def unsubscribed
    logger.info 'клиент отписан'
  end

  def send_rate(*_args)
    ActionCable.server.broadcast('rate_channel', Rate.value_for_broadcast)
  end
end
