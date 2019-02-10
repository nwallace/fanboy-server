module Fanboy
  module Presenters
    class ApplicationPresenter
      include Inquiry::Report

      def self.inherited(subclass)
        subclass.search_class Fanboy::Searches.const_get(subclass.name.demodulize)
      end
    end

    class ResourceURIFormatter
      def call(request, record)
        "#{request.base_url}/api/v1/#{record.class.table_name}/#{record.to_param}"
      end
    end
  end
end
