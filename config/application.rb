require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KintaiB
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.time_zone = "Asia/Tokyo"
    config.i18n.default_locale = :ja # デフォルトの言語を日本語に設定します。
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.assets.initialize_on_precompile = false

    #config.autoload_paths += %W(#{config.root}/lib)
    # 特にここ！！Rails5から productionでも呼び出せるように設定しないといけない
    config.enable_dependency_loading = true 
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
