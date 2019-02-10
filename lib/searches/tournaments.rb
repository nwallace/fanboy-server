require "searches/application_search"
require "models/tournament"

module Fanboy
  module Searches
    class Tournaments < ApplicationSearch

      sort_order :start, "tournaments.starts DESC, tournaments.ends DESC"
    end
  end
end
