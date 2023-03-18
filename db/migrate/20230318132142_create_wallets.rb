class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.integer :walletable_id
      t.string :walletable_type

      t.timestamps
    end

    add_index :wallets, [:walletable_type, :walletable_id], unique: true
  end
end
