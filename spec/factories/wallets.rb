FactoryBot.define do
  factory :wallet do
    # association :walletable, factory: :user

    trait :with_balance do
      after(:create) { |wallet| wallet.deposit 1000 }
    end
  end
end
