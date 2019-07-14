# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])
require 'active_support'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/string'
require 'rack-timeout'
require 'scout_apm'
require 'oj'
require './app/controllers/application_controller'
require_all 'app'
