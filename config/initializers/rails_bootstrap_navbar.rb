BootstrapNavbar.configure do |config|
  config.bootstrap_version = '3.3.6'
  config.current_url_method = 'request.original_url'
  ActionView::Base.send :include, BootstrapNavbar::Helpers
end