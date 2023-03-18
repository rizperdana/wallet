require 'rails_helper'

RSpec.describe Wallet, type: :model do
  it { should belong_to(:walletable).without_validating_presence }
  it { should have_many :source_transactions }
  it { should have_many :target_transactions }
  let(:wallet) { create :wallet }

  describe '#balance: calculates sum of wallet' do
    it 'zero if no transactions' do
      expect(wallet.balance).to be_zero
    end

    it 'target_transactions minus source_transactions' do
      target_amt = 500
      source_amt = 200

      create :transaction, amount: target_amt, target_id: wallet.id
      create :transaction, amount: source_amt, source_id: wallet.id

      expect(wallet.balance).to eq target_amt - source_amt
    end

    it 'deposit: adds money from outside the system' do
      amount = Faker::Number.decimal(l_digits: 3)
      wallet.deposit amount
      expect(wallet.balance).to eq amount
    end

    it 'withdraw: sends money to outside the system' do
      amount_first = 1000
      amount_second = 700
      wallet.deposit amount_first
      wallet.withdraw amount_second
      expect(wallet.balance).to eq amount_first - amount_second
    end

    it 'transfer: send money to other wallet in system' do
      amount_first = 400
      amount_second = 300
      wallet.deposit amount_first
      wallet_second = create :wallet
      wallet.transfer_to wallet_second, amount: amount_second
      expect(wallet.balance).to eq amount_first - amount_second
      expect(wallet_second.balance).to eq amount_second
    end
  end
end
