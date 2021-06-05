# frozen_string_literal: true

FactoryBot.define do
  factory :forced_rate do
    rate { '88.888' }
    show_until { Time.current + 1.day }

    trait :invalid do
      rate { '-23' }
    end

    factory :invalid_forced_rate, traits: [:invalid]
  end
end
