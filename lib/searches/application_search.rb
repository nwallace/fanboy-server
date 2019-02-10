module Fanboy
  module Searches
    class ApplicationSearch
      include Inquiry::Search

      def self.inherited(subclass)
        subclass.model_class Fanboy::Models.const_get(subclass.name.demodulize.singularize)
      end
    end
  end
end
