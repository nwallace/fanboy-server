module Fanboy
  module Models
    class Match < ApplicationRecord

      belongs_to :round
      belongs_to :map
      has_many :match_participations, dependent: :destroy

      validates :round, presence: true
      validates :map, presence: true
      validates :best_of, presence: true
      validates :sort_order, presence: true
    end
  end
end
