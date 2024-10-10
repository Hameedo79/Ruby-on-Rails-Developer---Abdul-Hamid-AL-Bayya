class RemoveWalletIdFromTransaction < ActiveRecord::Migration[7.2]
  def change
    remove_column :transactions, :wallet_id, :integer
  end
end
