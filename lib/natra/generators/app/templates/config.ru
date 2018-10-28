require './config/environment'
# Call as early as possible so rack-timeout runs before all other middleware.
use Rack::Timeout, service_timeout: 5

ScoutApm::Rack.install!

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
