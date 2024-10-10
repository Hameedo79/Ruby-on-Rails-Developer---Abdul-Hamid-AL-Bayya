class WalletTransactionService
    def initialize(source_wallet="", target_wallet, amount, transaction_type)
      @source_wallet = source_wallet
      @target_wallet = target_wallet
      @amount = amount
      @transaction_type = transaction_type
    end
  
    def call
      ActiveRecord::Base.transaction do
        create_transaction
        update_wallets
      end
    end
  
    private
  
    def create_transaction
      Transaction.create(
        source_wallet: @source_wallet,
        target_wallet: @target_wallet,
        amount: @amount,
        transaction_type: @transaction_type
      )
    end
  
    def update_wallets
      if @transaction_type == 'credit'
        @target_wallet.update(balance:@target_wallet[:balance].to_i + @amount)
      elsif @transaction_type == 'debit'
        @target_wallet.update(balance:@target_wallet[:balance].to_i + @amount)
        @source_wallet.update(balance:@source_wallet[:balance].to_i - @amount)
      end
    end
  end
  