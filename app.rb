require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models

get "/" do
  erb :index
end
