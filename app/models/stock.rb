class Stock < ApplicationRecord
    has_one :wallet, as: :walletable
    validates :name, presence: true
end
