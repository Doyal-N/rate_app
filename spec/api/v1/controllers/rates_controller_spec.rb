# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::RatesController, type: :request do
  let(:headers) do
    { 'CONTENT-TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end

  describe 'GET#current_rate' do
    context 'when status 200' do
      it 'returns successful response and data' do
        allow(GetCurrentRateService).to receive(:value_for_broadcast).and_return('77.777')

        get api_v1_current_rate_path, headers: headers

        expect(response).to have_http_status(:ok)
        expect(json_data['data']).to eq('77.777')
      end
    end

    context 'when data empty' do
      it 'returns error' do
        allow(GetCurrentRateService).to receive(:value_for_broadcast).and_return(nil)

        get api_v1_current_rate_path, headers: headers

        expect(json_data['data']).to be_empty
        expect(json_data['status']).to eq(204)
      end
    end
  end
end
