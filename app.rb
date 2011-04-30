# app.rb app file ===================================================
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'gollum'
require 'compass'
require 'pony'
require 'hashie'
require 'erb' # is not a gem

# put the LIB directory on the load path
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

Compass.configuration do |config|
  config.project_path = File.dirname(__FILE__)
  config.sass_dir = File.join(Sinatra::Application.views, 'sass')
  config.output_style = :compact
end
Wiki = Hashie::Mash.new
Wiki.root = File.dirname(__FILE__)

# load application parts ============================================
load 'models.rb'
load 'helpers.rb'
load 'routes.rb'
