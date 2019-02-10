require "models/application_record"

module Fanboy
  module Models
    class Tournament < ApplicationRecord
      belongs_to :title

      validates :title, presence: true
      validates :name, presence: true
      validates :starts, presence: true
    end
  end
end
