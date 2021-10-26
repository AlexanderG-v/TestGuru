require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    I18n.available_locales = %i[en ru]
    I18n.default_locale = :ru
    config.i18n.fallbacks = true
    config.i18n.fallbacks = [I18n.default_locale]
    
    config.time_zone = "Moscow"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
