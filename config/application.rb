require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# Bundler.require(:default, :assets, Rails.env)
Bundler.require(*Rails.groups)

module FinGoals
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Setting time zone for app to West Coast US
	config.time_zone = 'Pacific Time (US & Canada)'
  config.i18n.default_locale = :en

	# assets pipeline config to work on Heroku
    # config.assets.initialize_on_precompile = false

    # add active admin assets to precompile list, loaded from vendor/assets
    #config.assets.precompile += %w( active_admin.js active_admin.css.scss )

  end

end
