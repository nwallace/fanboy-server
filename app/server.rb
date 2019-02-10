require "presenters/titles"
require "presenters/tournaments"

module Fanboy
  class Server < Sinatra::Base

    set :public_folder, "public"

    get "/api/v1/titles" do
      presenter = Presenters::Titles.new(params)
      list_to_json(presenter, "titles")
    end

    get "/api/v1/titles/:id/tournaments" do |id|
      puts params
      presenter = Presenters::Tournaments.new(params)
      list_to_json(presenter, "tournaments")
    end

    private

    def list_to_json(presenter, resource_name)
      results = presenter.results
      {
        resource_name => presenter.rows.map do |row|
          presenter.columns.zip(row.values).each_with_object({}) do |(column, value), hash|
            hash[column.key] = value.render(request)
          end
        end,
        meta: {
          uri: request.url,
          pagination: {
            page: results.current_page,
            per_page: results.per_page,
            total_pages: results.total_pages,
            total_entries: results.total_entries,
            offset: results.offset,
          },
        },
      }.to_json
    end
  end
end
