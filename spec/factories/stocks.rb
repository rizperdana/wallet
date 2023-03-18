FactoryBot.define do
  factory :stock do
    name { Faker::Games::Dota.hero }
  end
end
