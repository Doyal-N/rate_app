# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::ForcedRatesController, type: :request do
  let(:headers) do
    { 'CONTENT-TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end

  describe 'GET#last_rate' do
    context 'when status 200' do
      let!(:forced_rate) { create(:forced_rate) }

      it 'returns successful response and data' do
        get api_v1_last_rate_path, headers: headers

        expect(response).to have_http_status(:ok)
        expect(json_data['data']['rate']).to eq(forced_rate.rate.to_s)
        time_point = ActiveSupport::TimeZone['Asia/Yekaterinburg'].parse(json_data['data']['show_until'])

        expect(time_point.to_i).to eq(forced_rate.show_until.to_i)
      end
    end

    context 'when empty data' do
      it 'returns empty data' do
        get api_v1_last_rate_path, headers: headers

        expect(response.body).to eq('')
        expect(response.status).to eq(204)
      end
    end
  end

  describe 'POST#create' do
    context 'when valid attributes' do
      let(:post_request) do
        post api_v1_forced_rates_path,
             params: { forced_rate: { rate: 11.111, show_until: '2030-03-15T17:00:00.000+05:00' } }
      end

      let(:forced_rate) { create(:forced_rate) }

      it 'returns 200 status and return proper json' do
        post_request

        expect(response).to have_http_status(:ok)
        expect(json_data['data']['rate']).to eq('11.111')
        expect(json_data['data']['show_until']).to eq('2030-03-15T17:00:00.000+05:00')
      end

      it 'matches with rate' do
        expect { ActionCable.server.broadcast('rate', forced_rate.rate) }
          .to have_broadcasted_to('rate').with('88.888')
      end
    end

    context 'invalid data params' do
      let(:post_request) do
        post api_v1_forced_rates_path,
             params: { forced_rate: { rate: -70, show_until: '2030-03-15T17:00:00.000+05:00' } }.to_json, headers: headers
      end

      it 'return status 422 and errors' do
        post_request

        expect(response.status).to eq(422)
        expect(json_data['errors']).not_to be_empty
      end
    end
  end
end
