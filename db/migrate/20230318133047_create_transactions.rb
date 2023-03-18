class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :source_id
      t.integer :target_id
      t.float :amount

      t.timestamps
    end
  end
end
