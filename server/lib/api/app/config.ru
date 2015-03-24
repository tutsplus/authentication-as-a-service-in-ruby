require 'bundler'
Bundler.require
require "./app"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: File.expand_path("../../../../db/development.sqlite3", __FILE__)
)

run App
