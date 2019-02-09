module Fanboy

  class Environment
    ENVS = %i[development test production]

    class InvalidEnvironmentError < StandardError
      def initialize(env)
        super "Invalid environment #{env.inspect}. Must e one of #{ENVS}"
      end
    end

    attr_reader :name

    def initialize(rack_env)
      @name = rack_env.downcase.to_sym
      raise InvalidEnvironmentError.new(rack_env) unless ENVS.include?(@name)
    end

    ENVS.each do |name|
      define_method("#{name}?") do
        self.name == name
      end
    end
  end

  def self.env
    require "dotenv/load"
    ENV["RACK_ENV"] ||= "development"
    @env ||= Environment.new(ENV.fetch("RACK_ENV"))
  end
end
