require 'rails_helper'

RSpec.feature 'User visit main page and see rate USD/RUB', type: :feature do
  feature 'user sees rate, which set admin', js: true do

    describe 'forced_rate correct and present' do
      given!(:forced_rate) { create(:forced_rate) }

      scenario 'user sees fake rate' do
        visit root_path

        within('#rate') { expect(page).to have_content(forced_rate.rate) }
      end
    end

    describe 'forced_rate empty or invalid' do
      given!(:forced_rate) { create(:forced_rate, show_until: Time.now) }

      scenario 'user sees CBR rate' do
        visit root_path

        within('#rate') { expect(page).not_to have_content(forced_rate.rate) }
      end
    end
  end
end
