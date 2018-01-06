Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  #config.action_mailer.raise_delivery_errors = false
  
  
  ####### MASA
  
  #   #メールは必ず送られないといけない
  # config.action_mailer.raise_delivery_errors = true
  
  # config.action_mailer.delivery_method = :test
  
  # #送り先(俺ら)の情報
  # #host = 'practice-ruby-jizokm.c9users.io'     # Cloud IDE
  # #config.action_mailer.default_url_options = { host: host, protocol: 'https' }
  # #or
  # host = 'localhost:3000'                     # Local server
  # config.action_mailer.default_url_options = { host: host, protocol: 'http' }

config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true

  config.action_mailer.default_url_options = { :host => 'timee-online.com' }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => "smtp.muumuu-mail.com",
    :port => "587",
    :domain => "timee-online.com",
    :user_name => "info@timee-online.com",
    :password => "Enloop1234",
    :authentication => "plain",
    :enable_starttls_auto => true
  } 




  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
