module Fanboy
  module Searches
    class Titles < ApplicationSearch

      model_class Fanboy::Models::Title

      sort_order :priority, [:priority, :name]
    end
  end
end
