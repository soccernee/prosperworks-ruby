source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Specify your gem's dependencies in prosperworks-ruby.gemspec
gemspec

group :test do
  gem 'minitest', '~> 5.0'
  gem 'rubocop', '~> 0.49.1', require: false
  gem 'webmock', '~> 3.0'
end
