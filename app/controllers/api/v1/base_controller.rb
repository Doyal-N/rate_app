# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      def render_success(data)
        render json: { data: data, errors: [] }, status: :ok
      end

      def render_errors(errors:, status:)
        render json: { data: [], errors: errors }, status: status
      end

      def broadcast_rate(value)
        ActionCable.server.broadcast('rate_channel', value)
      end
    end
  end
end
