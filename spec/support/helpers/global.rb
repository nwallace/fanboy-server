module Fanboy
  module Spec
    module GlobalHelpers
    end
  end
end

RSpec.configure do |config|
  config.include Fanboy::Spec::GlobalHelpers
end
