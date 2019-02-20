module Fanboy
  module Models
    class MatchParticipation < ApplicationRecord

      belongs_to :competitor
      belongs_to :match

      validates :competitor, presence: true
      validates :match, presence: true

      delegate :name, :logo_uri, to: :competitor
    end
  end
end
