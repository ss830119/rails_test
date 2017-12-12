# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'


Rails.application.config.assets.enabled = true

Rails.application.config.assets.paths << Rails.root.join('node_modules')


Rails.application.config.assets.paths << Rails.root.join("vendor")
Rails.application.config.assets.paths << Rails.root.join("public/plugins")

Rails.application.config.assets.precompile += %w( i18n.js )

Rails.application.config.assets.precompile += %w( backends.js backends.css )
# Rails.application.config.assets.precompile += %w( home.js home.css )
