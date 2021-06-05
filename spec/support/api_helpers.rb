# frozen_string_literal: true

module ApiHelpers
  def json_data
    @json_data ||= JSON.parse(response.body)
  end
end
