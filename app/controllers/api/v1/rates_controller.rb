# frozen_string_literal: true

module Api
  module V1
    class RatesController < Api::V1::BaseController
      def current_rate
        rate = GetCurrentRateService.value_for_broadcast

        if rate.present?
          render_success(rate)
        else
          render json: { data: [], status: 204 }
        end
      end
    end
  end
end
