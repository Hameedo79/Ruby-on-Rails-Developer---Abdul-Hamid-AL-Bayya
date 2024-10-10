class ChangeColumnTypeInTransaction < ActiveRecord::Migration[7.2]
  def change
    change_column(:transactions, :source_wallet_id, :integer, null:true)
  end
end
