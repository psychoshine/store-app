require_relative 'boot'

require 'rails/all'


Bundler.require(*Rails.groups)

module Parallax
  class Application < Rails::Application

    config.i18n.available_locales = [:ru, :ua]
  	config.i18n.default_locale = :ua

  end
end
