# Licensed to Elasticsearch B.V under one or more agreements.
# Elasticsearch B.V licenses this file to you under the Apache 2.0 License.
# See the LICENSE file in the project root for more information

source 'https://rubygems.org'

# Specify your gem's dependencies in elasticsearch-dsl.gemspec
gemspec

if File.exist? File.expand_path('../../elasticsearch/elasticsearch.gemspec', __FILE__)
  gem 'elasticsearch', path: File.expand_path('../../elasticsearch', __FILE__), require: false
end

if File.exist? File.expand_path('../../elasticsearch-transport', __FILE__)
  gem 'elasticsearch-transport', path: File.expand_path('../../elasticsearch-transport', __FILE__), require: true
end

if File.exist? File.expand_path('../../elasticsearch-api', __FILE__)
  gem 'elasticsearch-api', path: File.expand_path('../../elasticsearch-api', __FILE__), require: false
end

if File.exist? File.expand_path('../../elasticsearch-extensions', __FILE__)
  gem 'elasticsearch-extensions', path: File.expand_path('../../elasticsearch-extensions', __FILE__), require: false
end

group :development do
  gem 'rspec'
  if defined?(JRUBY_VERSION)
    gem 'pry-nav'
  else
    gem 'pry-byebug'
  end
end
