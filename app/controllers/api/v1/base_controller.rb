class Api::V1::BaseController < ApplicationController
  def render_success(data)
    render json: { data: data, errors: [] }, status: 200
  end

  def render_errors(errors:, status:)
    render json: { data: [], errors: errors }, status: status
  end
end
