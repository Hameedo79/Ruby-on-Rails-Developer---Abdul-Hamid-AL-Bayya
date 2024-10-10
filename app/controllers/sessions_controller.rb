class SessionsController < ApplicationController
    def create
      if params[:name].nil? 
        return render json: { message: 'name cannot be empty' }, status: 400
      end

      @user = User.find_by(name: params[:name])

      if @user.nil? || @user.blank?
        @user = User.new(name:params[:name])
       
        if @user.save
          @user.create_wallet
        end
      else
        @wallet = Wallet.find_by(walletable_id: @user[:id])
      end

      session[:name] = params[:name]
      session[:user_id] = @user[:id]
      render json: { message: 'Session created' }, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
    
    def destroy
      session.delete(:user_id)
      render json: { message: "Logged out" }, status: :ok
    end
end
