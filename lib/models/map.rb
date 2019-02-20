module Fanboy
  module Models
    class Map < ApplicationRecord

      belongs_to :title
      has_many :matches, dependent: :destroy

      validates :title, presence: true
      validates :name, presence: true

      delegate :name, to: :map
    end
  end
end
