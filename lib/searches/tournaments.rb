require "searches/application_search"
require "models/tournament"

module Fanboy
  module Searches
    class Tournaments < ApplicationSearch

      search_clause :title_slug, "titles.slug = ?", joins: :title

      sort_order :start, "tournaments.starts DESC, tournaments.ends DESC"
    end
  end
end
