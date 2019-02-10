require_relative "environment"

require "rubygems"
require "bundler"
Bundler.require(:default, Fanboy.env.name)

lib_path = File.expand_path(File.join(__dir__, "..", "lib"))
$LOAD_PATH.unshift(lib_path) unless $LOAD_PATH.include?(lib_path)
