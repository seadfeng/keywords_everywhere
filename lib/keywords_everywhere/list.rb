# frozen_string_literal: true
require 'forwardable'
module KeywordsEverywhere
  class List
    extend Forwardable
    attr_accessor :items

    def_delegators :@items, :to_json, :size

    def initialize(data)
      @items = data
    end

    def self.to_items(data)
        data.map {|d| Item.new(d)}
    end

    def to_items
        items.map {|d| Item.new(d)}
    end

  end
end