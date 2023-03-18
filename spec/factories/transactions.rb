FactoryBot.define do
  factory :transaction do
    source { nil }
    target { nil }
    amount { Faker::Number.decimal(l_digits: 3) }
  end
end
