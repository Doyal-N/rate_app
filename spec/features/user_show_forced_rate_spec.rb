# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User visit main page and see rate USD/RUB', type: :feature do
  describe 'user sees rate, which set admin', js: true do
    before { visit root_path }

    describe 'forced_rate correct and present' do
      let!(:forced_rate) { create(:forced_rate) }

      it 'user sees fake rate' do
        within('#rate') { expect(page).to have_content(forced_rate.rate) }
      end
    end

    describe 'forced_rate empty or invalid' do
      let!(:forced_rate) { create(:forced_rate, show_until: Time.zone.now) }

      it 'user sees CBR rate' do
        within('#rate') { expect(page).not_to have_content(forced_rate.rate) }
      end
    end
  end
end
