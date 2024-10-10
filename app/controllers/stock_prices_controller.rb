class StockPricesController < ApplicationController
    def show
        # Please change the RAPIDAPI_KEY Value in .env file first
        client = LatestStockPrice::Client.new(ENV['RAPIDAPI_KEY'])
        symbol = params[:symbol]
        @price = client.price(symbol)
        render json: @price
      rescue StandardError => e
        render json: { error: e.message }, status: :bad_request
      end
    
      def index
        client = LatestStockPrice::Client.new(ENV['RAPIDAPI_KEY'])
        symbols = params[:symbols].split(',')
        @prices = client.prices(symbols)
        render json: @prices
      rescue StandardError => e
        render json: { error: e.message }, status: :bad_request
      end
    
      def all
        client = LatestStockPrice::Client.new(ENV['RAPIDAPI_KEY'])
        @all_prices = client.price_all
        render json: @all_prices
      rescue StandardError => e
        render json: { error: e.message }, status: :bad_request
      end
end
