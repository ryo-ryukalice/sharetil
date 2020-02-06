FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Name#{n}" }
    sequence(:nickname) { |n| "Nickname#{n}" }
  end
end
