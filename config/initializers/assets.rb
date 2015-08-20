# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( global.css )
#
#注意: app/assets 和 lib/assets / vendor/assets 之間的行為要分開。app/assets 是你自己開發的，應該要自動 load。lib 和 vendor 則應該要手掛。所以如果 image 或 icon-font 放在 lib/assets & vendor/assets。開發者要自己在 config/enviorments/production.rb 的 config.assets.precompile 下自動一個一個加入想壓的（非 css/js 的 asset) 才可以。
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)