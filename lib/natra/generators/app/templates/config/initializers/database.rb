
require "yaml"
settings = YAML::load_file("config/db.yml")

require "sequel"
DB = Sequel.connect(settings[ENV['SINATRA_ENV']])

