class AddExtensions < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore'
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'
  end
end
