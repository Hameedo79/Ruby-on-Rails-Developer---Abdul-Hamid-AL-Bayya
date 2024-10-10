class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: "Wallet", optional: true
  belongs_to :target_wallet, class_name: "Wallet", optional: true
  
  validates :amount, presence: true
  validate :valid_wallets

  def valid_wallets
    if transaction_type == 'debit' && !target_wallet.present?
      errors.add(:target_wallet, "cannot be nil for debits")
    end
  end
end
