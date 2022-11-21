# frozen_string_literal: true
require "keywords_everywhere/version"

require 'keywords_everywhere/client'
require 'keywords_everywhere/list'
require 'keywords_everywhere/item'

require 'json'

module KeywordsEverywhere
  class Error < StandardError; end
  DEFAULT_MARKET = :us
  DEFAULT_SOURCE  = :gkp
  DEFAULT_CURRENCY = :usd 


  class << self
    attr_accessor :secret_key, :source, :market, :currency
    
    def configure
      yield self
      true
    end
    alias_method :config, :configure
  end
  
end