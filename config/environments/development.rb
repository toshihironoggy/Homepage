Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  
 
  # mailer setting
  config.action_mailer.default_url_options={host: '59fed92034d74c2285c20c4aa0778ac5.vfs.cloud9.ap-northeast-1.amazonaws.com', protocol: 'https'}                   
  
  # mail setting
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  
  #Mailtrap用
  #config.action_mailer.smtp_settings = {
  #  :user_name => '6e99a539c03d39',
  #  :password => '5fd76879238add',

  #  :address => 'smtp.mailtrap.io',
    #:domain => 'smtp.mailtrap.io',
    
  #  :port => '2525',
  #  :authentication => :cram_md5
    #:enable_starttls_auto => true
  
  #}
  
  #gmail用
  config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :user_name => 'toshihironogi8@gmail.com',
    :password => 'beia srcr zzvw yydc',
    
    :authentication => :plain,
    :enable_starttls_auto => true,
  }
  
end
