source "https://rubygems.org"

gem 'cocoapods', '>= 1.10.0'
gem 'cocoapods-keys'
gem "fastlane"
gem 'rubocop'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
