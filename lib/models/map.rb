module Fanboy
  module Models
    class Map < ApplicationRecord

      belongs_to :title
      has_many :matches, dependent: :destroy

      validates :title, presence: true
      validates :name, presence: true
    end
  end
end
