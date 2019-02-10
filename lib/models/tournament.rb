require "models/application_record"

module Fanboy
  module Models
    class Tournament < ApplicationRecord
      belongs_to :title
    end
  end
end
