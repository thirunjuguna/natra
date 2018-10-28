class AddExtensions < ActiveRecord::Migration
    def change
      enable_extension 'hstore'
      enable_extension 'uuid-ossp'
      enable_extension 'pgcrypto'
    end
end