require 'thor'
module Natra
  class CLI < Thor
    desc '-v', 'Show Natra version number'
    map %w[-v --version] => :version
    # USAGE: Natra -v
    def version
      say "Natra #{Natra::VERSION::STRING}"
    end
    # register(class_name, subcommand_alias, usage_list_string, description_string)
    register Natra::Generators::AppGenerator, 'new', 'new APP_PATH', 'Creates a new Sinatra application'
    register Natra::Generators::ModelGenerator, 'model', 'model NAME', 'Generate a model'
    register Natra::Generators::ControllerGenerator, 'controller', 'controller NAME', 'Generate a controller'
    register Natra::Generators::ScaffoldGenerator, 'scaffold', 'scaffold NAME', 'Generate a model with its associated views and controllers'

    def self.exit_on_failure
      true
    end
  end
end
