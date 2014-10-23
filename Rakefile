require 'bundler'
require 'yaml'
require 'byebug'
require 'csv'

Bundler.require

Dir.glob('./lib/*.rb').each { |file| require file }
Dir.glob('./tasks/*.rake').each { |r| load r }