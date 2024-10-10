class Wallet < ApplicationRecord
  belongs_to :walletable, polymorphic: true
  has_many :transactions

  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  
  def balance
    transactions.sum("CASE WHEN transaction_type = 'credit' THEN amount ELSE -amount END")
  end
end
