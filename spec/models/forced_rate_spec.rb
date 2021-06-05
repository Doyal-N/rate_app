# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ForcedRate, type: :model do
  describe 'rate validations' do
    it { is_expected.to validate_presence_of(:rate) }
    it { is_expected.to validate_numericality_of(:rate) }
    it { is_expected.to validate_presence_of(:show_until) }
  end
end
