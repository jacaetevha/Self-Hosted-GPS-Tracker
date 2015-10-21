# config.ru
require 'bundler'
require 'sinatra'
require 'sequel'
Sequel::Model.db = Sequel.connect(ENV.fetch("DATABASE_URL"))

require './app.rb'
run Sinatra::Application
