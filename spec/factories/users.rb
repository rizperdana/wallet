FactoryBot.define do
  factory :user do
    name { Faker::Games::Dota.player }
  end
end
