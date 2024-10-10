class TransactionsController < ApplicationController
    def create
      if params[:transaction_type].nil? 
        return render json: { message: 'transaction type cannot be empty' }, status: 400
      end

      if params[:transaction_type] == "debit"
        if params[:target_name].nil? 
          return render json: { message: 'target name cannot be empty' }, status: 400
        end
        
        @source_wallet = Wallet.find_by(walletable_id: session.to_hash["user_id"])

        if @source_wallet[:balance] < params[:amount] 
          return render json: { message: 'balance is not enough to make this transaction' }, status: 400
        end
          
        target_user = User.find_by(name: params[:target_name])
        
        if target_user.blank? 
          return render json: { message: 'target user cannot be found' }, status: 404
        end

        if session.to_hash["user_id"] == target_user[:id]
          return render json: { message: 'you cannot send money to yourself' }, status: 400 
        end

        @target_wallet = Wallet.find_by(walletable_id: target_user[:id])
      else
        @target_wallet = Wallet.find_by(walletable_id: session.to_hash["user_id"])
      end

      service = WalletTransactionService.new(@source_wallet, @target_wallet, params[:amount], params[:transaction_type])
      service.call

      render json: { status: 'success' }, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
