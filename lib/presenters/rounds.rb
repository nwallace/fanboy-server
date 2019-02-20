require "presenters/application_presenter"
require "searches/rounds"

module Fanboy
  module Presenters
    class Rounds < ApplicationPresenter

      column :name, default: true
      column :matches, default: true,
        includes: { matches: [:map, { match_participations: :competitor }] },
        formatter: -> (view, round) {
          round.matches.sort(&:sort_order).map do |match|
            {
              best_of: match.best_of,
              map_name: match.map_name,
              competitors: match_participations.map do |participation|
                {
                  competitor: participation.competitor_name,
                  competitor_logo_uri: participation.competitor_logo_uri,
                  score: participation.score,
                }
              end
            }
          end.to_json
        }
    end
  end
end
