# frozen_string_literal: true
require 'forwardable'
module KeywordsEverywhere
  class Item
    extend Forwardable
    attr_accessor :hash 

    def_delegators :@hash, :dig, :to_json

    def initialize(data)
      @hash = data
    end

    def vol
        get(%w{vol})
    end

    def cpc
        get(%w{cpc})
    end

    def keyword
        get(%w{keyword})
    end

    def competition
        get(%w{competition})
    end

    def trend
        get(%w{trend})
    end

    def get(keys)
        @hash.dig(*keys)
    end

  end
end