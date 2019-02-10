require "searches/application_search"
require "models/title"

module Fanboy
  module Searches
    class Titles < ApplicationSearch

      sort_order :priority, [:priority, :name]
    end
  end
end
