require './config/environment'
use Rack::Timeout, service_timeout: 5
ScoutApm::Rack.install!
run ApplicationController
