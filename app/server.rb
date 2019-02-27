require "presenters/titles"
require "presenters/tournaments"
require "presenters/rounds"

module Fanboy
  class Server < Sinatra::Base

    set :public_folder, "public"

    before do
      headers(
        "Access-Control-Allow-Origin" => "*",
        "Access-Control-Allow-Methods" => "*",
      )
    end

    get "/api/v1/titles" do
      presenter = Presenters::Titles.new(params)
      list_to_json(presenter, "titles")
    end

    get "/api/v1/titles/:slug/tournaments" do |slug|
      presenter = Presenters::Tournaments.new(title_slug: slug)
      list_to_json(presenter, "tournaments")
    end

    get "/api/v1/tournaments/:id" do |id|
      presenter = Presenters::Rounds.new(tournament_id: id)
      list_to_json(presenter, "rounds")
    end

    get "/" do
      html :index
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

    def html(view)
      send_file File.join(settings.public_folder, "#{view}.html")
    end
  end
end
