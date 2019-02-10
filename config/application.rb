require_relative "environment"

require "rubygems"
require "bundler"
Bundler.require(:default, Fanboy.env.name)

Dir[File.join(__dir__, "..", "lib", "models", "*.rb")].each { |file| require file }
Dir[File.join(__dir__, "..", "lib", "**", "*.rb")].each { |file| require file }
