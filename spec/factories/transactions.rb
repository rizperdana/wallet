FactoryBot.define do
  factory :transaction do
    source factory: :wallet
    target factory: :wallet
    amount { Faker::Number.decimal(l_digits: 3) }
  end
end
