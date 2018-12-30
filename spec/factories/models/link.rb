FactoryBot.define do
  factory :link, class: Link do
    trait :valid_url do
      url { Faker::Internet.url }
    end

    trait :invalid_url do
      url { 'h' << Faker::Internet.url }
    end
  end
end