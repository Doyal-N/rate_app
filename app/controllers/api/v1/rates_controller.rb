class Api::V1::RatesController < Api::V1::BaseController
  def current_rate
    rate = GetCurrentRate.value_for_broadcast
    render_success(rate)
  end
end
