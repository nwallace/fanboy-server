require "presenters/application_presenter"
require "searches/tournaments"

module Fanboy
  module Presenters
    class Tournaments < ApplicationPresenter

      column :title, default: true, includes: :title, formatter: -> (_, tournament) { tournament.title.name }
      column :name, default: true
      column :starts, default: true, formatter: JSONFormatter.new(:starts)
      column :ends, default: true, formatter: JSONFormatter.new(:ends)
      column :uri, default: true, formatter: -> (request, tournament) {
        "#{request.base_url}/api/v1/tournaments/#{tournament.to_param}"
      }
      column :logo_uri, default: true

      default_criteria sort_order: :start
    end
  end
end
