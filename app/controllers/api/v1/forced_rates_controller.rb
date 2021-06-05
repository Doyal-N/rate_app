# frozen_string_literal: true

module Api
  module V1
    class ForcedRatesController < Api::V1::BaseController
      def last_rate
        forced_rate = ForcedRate.last

        if forced_rate
          render_success(forced_rate)
        else
          render_errors(errors: [], status: 204)
        end
      end

      def create
        forced_rate = ForcedRate.new(forced_rate_params)

        if forced_rate.save
          render_success(forced_rate)

          if forced_rate.show_until > Time.current
            broadcast_rate(forced_rate.rate)

            ResumeJob.perform_later(forced_rate.show_until)
          end
        else
          render_errors(errors: forced_rate.errors.full_messages, status: 422)
        end
      end

      private

      def forced_rate_params
        params.require(:forced_rate).permit(:rate, :show_until)
      end
    end
  end
end
