require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Marcuspereira
  class Application < Rails::Application
    config.load_defaults 7.0

    config.time_zone = 'America/Sao_Paulo'
    config.i18n.default_locale = :'pt-BR'
  end
end
