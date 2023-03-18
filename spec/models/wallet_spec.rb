require 'rails_helper'

RSpec.describe Wallet, type: :model do
  it { should belong_to(:walletable) }
  it { should have_many :source_transactions }
  it { should have_many :target_transactions }
end
