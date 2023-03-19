class Transaction < ApplicationRecord
  has_one :source, class_name: 'Wallet', foreign_key: :id, primary_key: :source_id
  has_one :target, class_name: 'Wallet', foreign_key: :id, primary_key: :target_id
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :balance_cannot_negative

  def kind
    return :deposit if source.nil?
    return :withdraw if target.nil?

    :transfer
  end

  def balance_cannot_negative
    if source && amount.present? && (source.balance < amount)
      errors.add :amount, 'should be equal or greater than actual balance'
    end
  end
end
