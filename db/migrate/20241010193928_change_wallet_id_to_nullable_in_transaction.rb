class ChangeWalletIdToNullableInTransaction < ActiveRecord::Migration[7.2]
  def change
    change_column(:transactions, :wallet_id, :integer, null:true)
  end
end
