require 'rails_helper'

RSpec.describe Wallet, type: :model do
  it { should belong_to(:walletable) }
  it { should have_many :source_transactions }
  it { should have_many :target_transactions }

  describe '#balance: calculates sum of wallet' do
    let(:wallet) { create :wallet }

    it 'zero if no transactions' do
      expect(wallet.balance).to be_zero
    end

    it 'target_transactions minus source_transactions' do
      target_amt = Faker::Number.decimal(l_digits: 3)
      source_amt = Faker::Number.decimal(l_digits: 3)

      create :transaction, amount: target_amt, target_id: wallet.id
      create :transaction, amount: source_amt, source_id: wallet.id

      expect(wallet.balance).to eq target_amt - source_amt
    end
  end
end
