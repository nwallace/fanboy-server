module Fanboy
  class Server < Sinatra::Base

    get "/api/v1/titles" do
      json(
        titles: Models::Title.order(:priority, :name).map do |title|
          {
            name: title.name,
            nickname: title.nickname,
            developer: title.developer,
            uri: uri("/api/v1/titles/#{title.slug}"),
          }
        end
      )
    end

    private

    def json(obj)
      obj.to_json
    end

    def uri(path)
      "#{request.base_url}#{path}"
    end
  end
end
