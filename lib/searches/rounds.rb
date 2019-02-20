require "searches/application_search"
require "models/round"

module Fanboy
  module Searches
    class Rounds < ApplicationSearch

      search_clause :tournament_id, "rounds.tournament_id = ?"

      sort_order :sort_order
    end
  end
end
