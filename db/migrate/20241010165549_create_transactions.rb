class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.references :wallet, null: false, foreign_key: true
      t.decimal :amount
      t.string :transaction_type

      t.timestamps
    end
  end
end
