# frozen_string_literal: true
require 'rest-client'
module KeywordsEverywhere
    class Client
        attr_accessor :source, :currency, :market
        attr_reader :response, :secret_key

        def initialize( 
            secret_key:     KeywordsEverywhere.secret_key       || ENV['KW_SECRET'],
            market:         KeywordsEverywhere.market           || DEFAULT_MARKET,  
            source:         KeywordsEverywhere.source           || DEFAULT_SOURCE,
            currency:       KeywordsEverywhere.currency         || DEFAULT_CURRENCY 
        ) 

            @source = source.to_s.downcase
            @secret_key = secret_key
            @market = market.to_s.downcase
            @currency = currency.to_s.downcase
            
        end

        def search_items(keywords)
            if keywords.is_a?(String)
                keywords = [keywords] 
            end
            raise StandardError, "Keyword Up to 100" if keywords.size > 100 # https://api.keywordseverywhere.com/docs/#/keywords/get_keywords_data
            
            client = rest_client(   method: :post, 
                                    url: "https://api.keywordseverywhere.com/v1/get_keyword_data", 
                                    payload: payload( kw: keywords ),
                                    headers: headers )
            @response = JSON.parse(client.body)
            to_items
        end

        def credits
            response.dig('credits')
        end

        def time
            response.dig('time')
        end

        def list
            List.new(response.dig('data'))
        end

        def to_items
            list.to_items
        end

        protected

        def payload(merge_params = {} )
            { 
                dataSource: source, 
                country: market, 
                currency: currency
            }.merge(merge_params)
        end

        def headers
            {  
                "authority": "api.keywordseverywhere.com",
                "accept": "application/json",
                "authorization": "Bearer #{secret_key}",
            }
        end

        private

        def rest_client( opts = {} ) 
            begin
                RestClient::Request.execute(opts)
            rescue RestClient::ExceptionWithResponse  => e
                case e.http_code 
                when 301, 302, 307 
                  e.response.follow_redirection
                else 
                  raise
                end
            end
        end

    end
end