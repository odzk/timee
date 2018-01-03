source 'https://rubygems.org'

#ruby '2.3.4'
#ルビーのバージョン決める

#CSSとjquery
gem 'bootstrap'
gem 'jquery-rails'
gem 'responders', '~>2.4.0'

#calender
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'

#パスワードのハッシュ化
gem 'bcrypt','3.1.11'

#ダミーデータ
gem 'faker','1.7.3'

#ページネーション
gem 'will_paginate', '3.1.5'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'carrierwave'
gem 'payjp'

#リサイズ
gem 'fog', '1.40.0'
#本番環境に画像を移すとき用
#画像アップロードのためーーー

# Gemfile
# Pagenation
gem 'kaminari'
gem 'jquery-ui-rails'

# gem 'zbar', '~> 0.2.2'

# gem 'jp_prefecture'

#gemの追加後は、バンドルのインストール

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
 gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
# gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
#コンバート
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'ransack', '~> 1.8.4'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'tzinfo-data'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  
#  gem 'sqlite3'
  gem 'mysql2' 
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry-byebug', group: :development
  
  
end

group :production do
  gem 'sqlite3'
  gem 'rails_12factor'
  
  gem 'puma', '3.11.0'
end
