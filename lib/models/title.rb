module Fanboy
  module Models
    class Title < ApplicationRecord
      has_many :tournaments

      def to_param
        slug
      end
    end
  end
end
