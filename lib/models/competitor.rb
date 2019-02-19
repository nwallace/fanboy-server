module Fanboy
  module Models
    class Competitor < ApplicationRecord

      belongs_to :title
      has_many :match_participations, dependent: :destroy

      validates :title, presence: true
      validates :name, presence: true
    end
  end
end
