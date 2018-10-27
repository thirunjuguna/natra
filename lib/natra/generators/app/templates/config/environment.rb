ENV['SINATRA_ENV'] ||= "development"
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'active_support'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/string'

require 'rack-timeout'
require 'scout_apm'

require 'oj'
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
