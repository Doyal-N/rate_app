require 'rails_helper'

RSpec.describe Rate, type: :model do
  describe 'rate validations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value) }

    context 'when allow value' do
      it { is_expected.to allow_value('74.571').for(:value) }
      it { is_expected.to allow_value('74').for(:value) }
    end

    context 'when not allow value' do
      it { is_expected.not_to allow_value('100.256').for(:value) }
      it { is_expected.not_to allow_value('6.2567').for(:value) }
    end
  end
end
