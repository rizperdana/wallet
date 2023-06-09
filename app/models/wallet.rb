class Wallet < ApplicationRecord
  belongs_to :walletable, polymorphic: true, optional: true
  has_many :source_transactions, class_name: 'Transaction', foreign_key: :source_id
  has_many :target_transactions, class_name: 'Transaction', foreign_key: :target_id

  def balance
    balance_until Time.now
  end

  def balance_until(time)
    return 0 unless target_transactions.any?

    target_transactions.where('created_at <= ?', time).pluck(:amount).sum -
    source_transactions.where('created_at <= ?', time).pluck(:amount).sum
  end

  def deposit(amount)
    target_transactions.create amount: amount
  end

  def withdraw(amount)
    source_transactions.create amount: amount
  end

  def transfer_to(wallet, amount:)
    source_transactions.create amount: amount, target_id: wallet.id
  end

  def transactions
    Transaction.where('source_id = :id OR target_id = :id', id: id).order('created_at desc')
  end

  def to_s
    "#{walletable.name} (##{id})"
  end
end
