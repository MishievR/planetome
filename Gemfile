source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'


# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'



# gem 'bootstrap', '~> 4.0.0'
# gem 'devise'
# gem 'devise-bootstrap-views'
gem 'carrierwave'
# gem 'mini_magick'
gem 'fog'
gem 'figaro'
gem 'rails_autolink', '~> 1.1.3'
# gem 'acts_as_votable', '~> 0.11.1'
gem 'sendgrid-ruby'
gem 'will_paginate', '~> 3.1.0'
gem 'geocoder'
# gem "webpacker"
gem 'activerecord', '~> 6.0', '>= 6.0.2.1'
# gem 'administrate', github: 'excid3/administrate', branch: 'jumpstart'
gem 'bootstrap', '~> 4.3', '>= 4.3.1'
gem 'devise', '~> 4.7', '>= 4.7.0'
# gem 'devise-bootstrapped', github: 'excid3/devise-bootstrapped', branch: 'bootstrap4'
gem 'devise_masquerade', '~> 1.2'
gem 'font-awesome-sass', '~> 5.6', '>= 5.6.1'
# gem 'friendly_id', '~> 5.2', '>= 5.2.5'
# gem 'gravatar_image_tag', github: 'mdeering/gravatar_image_tag'
gem 'mini_magick', '~> 4.9', '>= 4.9.2'
gem 'name_of_person', '~> 1.1'
gem 'omniauth-facebook', '~> 5.0'
gem 'omniauth-github', '~> 1.3'
gem 'omniauth-twitter', '~> 1.4'
gem 'sidekiq', '~> 6.0', '>= 6.0.3'
gem 'sitemap_generator', '~> 6.0', '>= 6.0.1'
gem 'whenever', require: false
gem "simple_calendar", "~> 2.0"
gem 'acts_as_votable'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false




# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.3', '>= 1.3.11'
# Use Puma as the app server
# gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'stripe'

# gem 'acts-as-taggable-on', '~> 6.0'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'sqlite3'


end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :production do
  # gem 'pg', '~> 0.18.4'
  gem 'rails_12factor'

end
