source "https://rubygems.org"

gem 'cocoapods', '>= 1.10.0'
gem "fastlane"
gem 'rubocop'
gem 'phrase', git: 'https://github.com/phrase/phrase-ruby.git'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)

