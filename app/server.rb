module Fanboy
  class Server < Sinatra::Base

    %w[titles].each do |resource|
      presenter_class = Presenters.const_get(resource.camelcase)

      get "/api/v1/#{resource}" do
        presenter = presenter_class.new(params)
        to_json(presenter, resource)
      end

      private

      def to_json(presenter, resource_name)
        {
          resource_name => presenter.rows.map do |row|
            presenter.columns.zip(row.values).each_with_object({}) do |(column, value), hash|
              hash[column.key] = value.render(request)
            end
          end
        }.to_json
      end
    end
  end
end
