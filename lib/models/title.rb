require "models/application_record"

module Fanboy
  module Models
    class Title < ApplicationRecord
      has_many :tournaments

      validates :name, presence: true
      validates :nickname, presence: true
      validates :slug, presence: true
      validates :developer, presence: true
      validates :priority, presence: true

      def to_param
        slug
      end
    end
  end
end
