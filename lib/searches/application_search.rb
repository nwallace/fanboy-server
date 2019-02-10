require "models/application_record"

module Fanboy
  module Searches
    class ApplicationSearch
      include Inquiry::Search

      def self.inherited(subclass)
        model_name = subclass.name.demodulize.singularize
        subclass.model_class Fanboy::Models.const_get(model_name)
      end
    end
  end
end
