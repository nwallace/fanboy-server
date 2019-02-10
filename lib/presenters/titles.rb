require "presenters/application_presenter"
require "searches/titles"

module Fanboy
  module Presenters
    class Titles < ApplicationPresenter

      column :name, default: true
      column :nickname, default: true
      column :developer, default: true
      column :uri, default: true, formatter: ResourceURIFormatter.new
      column :logo_uri, default: true, formatter: -> (request, title) {
        "#{request.base_url}/assets/images/titles/logos/#{title.slug}.png"
      }

      default_criteria sort_order: :priority
    end
  end
end
