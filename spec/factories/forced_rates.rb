FactoryBot.define do
  factory :forced_rate do
    rate { 88.888 }
    show_until { Time.now + 1.day }
  end
end
