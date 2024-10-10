class AddNewFiledsToTransaction < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :source_wallet_id, :integer
    add_column :transactions, :target_wallet_id, :integer
  end
end
