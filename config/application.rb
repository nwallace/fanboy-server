require_relative "environment"

require "bundler/setup"
Bundler.require(:default, Fanboy.env.name)
