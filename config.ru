require 'rubygems'
require 'bundler/setup'
Bundler.require
if development?
  $stdout.sync = true
  require 'sinatra/reloader'
end
require 'sinatra/cometio'

require File.dirname(__FILE__)+'/main'

set :haml, :escape_html => true

run Sinatra::Application
