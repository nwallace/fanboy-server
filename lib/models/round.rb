module Fanboy
  module Models
    class Round < ApplicationRecord

      belongs_to :tournament
      has_many :matches

      validates :tournament, presence: true
      validates :name, presence: true
      validates :sort_order, presence: true
    end
  end
end
