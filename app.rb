require("sinatra")
require("sinatra/reloader")
require "active_record"
require "sinatra/activerecord"
also_reload("lib/**/*.rb")
require("./lib/brands")
require("./lib/stores")
require("pg")
require("pry")


get('/') do
  erb:index
end

get('/brands') do
  erb:stores
end

get('/stores') do
  erb:brands
end
