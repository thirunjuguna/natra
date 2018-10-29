require 'thor/group'
module Natra
  module Generators
    class AppGenerator < Thor::Group
      include Thor::Actions
      desc 'Creates a new Sinatra application'
      argument :name, type: :string, desc: 'The name of the new application'
      class_option :capistrano, type: :boolean, desc: 'Include Capistrano configuration'
      class_option :redis, type: :boolean, desc: 'Include Redis configuration'
      class_option :rvm, type: :boolean, desc: 'Create .ruby-version (ruby-2.1.0) and .ruby-gemset'
      class_option :bundle, type: :boolean, desc: 'Run bundle after generating the app'
      class_option :git, type: :boolean, desc: 'Initialize a Git repository'

      def setup
        @app_path = name.directory_name
        @name     = name.file_name
        options.each {|key, value| instance_variable_set "@#{key}".to_sym, value}
      end

      def self.source_root
        File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def create_empty_directories
        %w[config/initializers lib spec].each {|dir| empty_directory File.join(@app_path, dir)}
        empty_directory File.join(@app_path, 'db/migrate')
        create_file File.join(@app_path, 'lib', '.keep')
        template 'config/environment.rb', File.join(@app_path, 'config/environment.rb')
      end

      def create_seeds_file
        create_file File.join(@app_path, 'db', 'seeds.rb')
      end

      def initialize_db
        copy_file('bin/setup', File.join(@app_path, 'bin/setup'))
      end

      def uuid_setup
        template 'db/migrate/add_extensions.rb', File.join(@app_path, "db/migrate/#{Time.now.strftime('%Y%m%d')}0000_add_extensions.rb")
      end

      def create_public_directory
        template 'public/favicon.ico', File.join(@app_path, 'public/favicon.ico')
      end

      def create_app_directory
        %w[app/controllers app/views app/models].each {|dir| directory dir, File.join(@app_path, dir)}
      end

      def create_app_spec
        template 'spec/application_controller_spec.rb', File.join(@app_path, 'spec/application_controller_spec.rb')
      end

      def create_spec_helper
        template 'spec/spec_helper.rb', File.join(@app_path, 'spec/spec_helper.rb')
      end

      def create_config
        template 'config.ru', File.join(@app_path, 'config.ru')
      end

      def create_gemfile
        template 'Gemfile', File.join(@app_path, 'Gemfile')
      end

      def create_rakefile
        template 'Rakefile', File.join(@app_path, 'Rakefile')
      end

      def create_readme
        template('README.md', File.join(@app_path, 'README.md'))
      end

      def create_db_config
        template('config/db.yml', File.join(@app_path, 'config/db.yml'))
      end

      def create_database_initializer
        template('config/initializers/database.rb', File.join(@app_path, 'config/initializers/database.rb'))
      end

      def create_redis_config
        copy_file('config/redis.yml', File.join(@app_path, 'config/redis.yml')) if @redis
      end

      def create_redis_initializer
        template('config/initializers/redis.rb', File.join(@app_path, 'config/initializers/redis.rb')) if @redis
      end

      def create_gitignore
        copy_file 'gitignore', File.join(@app_path, '.gitignore')
      end

      def create_rspec
        copy_file 'rspec', File.join(@app_path, '.rspec')
      end

      def create_rubocop
        copy_file 'rubocop.yml', File.join(@app_path, '.rubocop.yml')
      end

      def create_docker
        copy_file 'Dockerfile', File.join(@app_path, 'Dockerfile')
      end

      def create_docker_compose
        template('docker-compose.yml', File.join(@app_path, 'docker-compose.yml'))
      end

      def create_guardfile
        copy_file 'Guardfile', File.join(@app_path, 'Guardfile')
      end

      def create_spec_support
        create_file File.join(@app_path, 'spec/support/', '.keep')
      end

      def create_secrets
        template('secrets.env', File.join(@app_path, 'secrets.env'))
      end

      def create_capistrano_config
        inside(@app_path) {run('cap install')} if @capistrano
      end

      def create_rvm_gemset
        if @rvm
          create_file(File.join(@app_path, '.ruby-version'), 'ruby-2.1.0')
          create_file(File.join(@app_path, '.ruby-gemset'), @app_path)

          @bundle = false
          puts "You need to run 'bundle install' manually."
        end
      end

      def initialize_git_repo
        inside(@app_path) {run('git init .') if @git}
      end

      def install_dependencies
        inside(@app_path) {run('bundle') if @bundle}
      end
    end
  end
end
