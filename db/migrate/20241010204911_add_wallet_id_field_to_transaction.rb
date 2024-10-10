class AddWalletIdFieldToTransaction < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :wallet_id, :integer
  end
end
