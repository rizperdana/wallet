require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should have_one :source }
  it { should have_one :target }
  it { should validate_presence_of :amount }
  it { should validate_numericality_of(:amount).is_greater_than 0 }

  it 'should validate amount to be equal or greater from balance' do
    amount_first = Faker::Number.decimal(l_digits: 3)
    amount_second = Faker::Number.decimal(l_digits: 3)
    wallet_first = create :wallet
    wallet_first.deposit amount_first
    transaction = wallet_first.withdraw amount_first + amount_second

    expect(transaction.errors).to be_any
    expect(transaction.errors[:amount]).to include('should be equal or greater than actual balance')
  end

  it 'should connect source/target with wallet' do
    wallet_source = create :wallet, :with_balance
    wallet_target = create :wallet, :with_balance
    transaction = create :transaction, source_id: wallet_source.id, target_id: wallet_target.id

    expect(transaction.source).to eq wallet_source
    expect(transaction.target).to eq wallet_target
    expect(wallet_source.source_transactions).to include transaction
    expect(wallet_target.target_transactions).to include transaction
  end

  it 'source/target can be nil' do
    transaction = create :transaction, source_id: nil, target_id: nil

    expect(transaction.source).to be_nil
    expect(transaction.target).to be_nil
  end

  it 'kind: returns transaction kind' do
    wallet_first = create :wallet, :with_balance
    wallet_second = create :wallet, :with_balance
    transaction = create :transaction, source_id: wallet_first.id, target_id: wallet_second.id
    expect(transaction.kind).to eq :transfer

    transaction = create :transaction, source_id: nil, target_id: wallet_second.id
    expect(transaction.kind).to eq :deposit

    transaction = create :transaction, source_id: wallet_first.id, target_id: nil
    expect(transaction.kind).to eq :withdraw
  end
end
