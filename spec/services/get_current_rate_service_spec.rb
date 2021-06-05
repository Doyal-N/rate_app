# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GetCurrentRateService do
  describe '.value_for_broadcast' do
    subject(:returned_value) { described_class.value_for_broadcast }

    context 'when forced rate present and correct' do
      let!(:forced_rate) { create(:forced_rate) }
      let!(:rate) { create(:rate) }

      it 'returns forced rate value' do
        expect(returned_value).to eq(forced_rate.rate)
      end
    end

    context 'when forced rate invalid' do
      let!(:rate) { create(:rate) }

      it 'returns rate value' do
        expect(returned_value).to eq(rate.value)
      end

      context 'when show_until in past' do
        let!(:forced_rate) { create(:forced_rate, show_until: Time.zone.now) }

        it 'returns rate value' do
          expect(returned_value).to eq(rate.value)
        end
      end
    end
  end
end
