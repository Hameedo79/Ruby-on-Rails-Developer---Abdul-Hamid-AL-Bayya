require 'httparty'

module LatestStockPrice
  class Client
    BASE_URL = 'https://latest-stock-price.p.rapidapi.com'

    def initialize(api_key)
      @api_key = api_key
    end

    def price(symbol)
      request(:get, "/price", { symbol: symbol })
    end

    def prices(symbols)
      request(:get, "/prices", { symbols: symbols.join(',') })
    end

    def price_all
      request(:get, "/price_all")
    end

    private

    def request(method, path, params = {})
      response = HTTParty.send(method, "#{BASE_URL}#{path}", {
        headers: {
          'X-RapidAPI-Host' => 'latest-stock-price.p.rapidapi.com',
          'X-RapidAPI-Key' => @api_key,
          'Content-Type' => 'application/json'
        },
        query: params
      })
      
      handle_response(response)
    end

    def handle_response(response)
      case response.code
      when 200
        response.parsed_response
      else
        raise "Error: #{response.code} - #{response.message}"
      end
    end
  end
end