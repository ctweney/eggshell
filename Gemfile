source 'https://rubygems.org'

# The core framework
# https://github.com/rails/rails
gem 'rails', '3.2.8'

# Postgresql adapter
gem "activerecord-jdbcpostgresql-adapter", "~> 1.2.2.1"

# Oracle adapter
gem "activerecord-oracle_enhanced-adapter", "~> 1.4.1"

# A JSON implementation as a Ruby extension in C
# http://flori.github.com/json/
gem 'json', '~> 1.7.5'

# Keep env blue/clean
# https://rubygems.org/gems/rails_config
gem 'rails_config', '~> 0.3.1'

# CAS Strategy for OmniAuth
# https://rubygems.org/gems/omniauth-cas
gem 'omniauth-cas', '~> 0.0.7'

# Sinatra core gem
# https://rubygems.org/gems/sinatra
gem "sinatra", "~> 1.3.3"

# Rest-Client: barebones rest-client proxy
# https://rubygems.org/gems/rest-client
gem "rest-client", "~> 1.6.7"

# Gems used only for assets and not required
# in production environments by default.
group :assets do

  # This library adds angularjs support to Rails applications
  # https://github.com/ludicast/angular-rails
  gem 'angular-rails', '~> 0.0.12'

  # CSS Framework - also includes Compass and SASS
  # https://github.com/zurb/foundation
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails', '~> 1.0.3'
  gem 'zurb-foundation', '~> 3.2.0'

  # Ruby wrapper for UglifyJS JavaScript compressor
  # https://github.com/lautis/uglifier
  gem 'uglifier', '~> 1.3.0'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'minitest-reporters'
end

group :development do
  # Automatically reloads your browser when 'view' files are modified.
  # https://github.com/guard/guard-livereload
  gem 'guard-livereload', '~> 1.1.0'
  gem 'rack-livereload', '~> 0.3.8'

  # Polling is evil:
  # https://github.com/guard/guard#readme
  gem 'rb-inotify', '~> 0.8.8', :require => false
  gem 'rb-fsevent', '~> 0.9.2', :require => false
  gem 'rb-fchange', '~> 0.0.6', :require => false

  # Start/stop rails + guard all at once
  # http://stackoverflow.com/questions/8293747/need-a-less-repetitve-way-to-start-rails-on-mac-for-noob
  # https://github.com/ddollar/foreman
  gem 'foreman', '~> 0.60.2'
end
