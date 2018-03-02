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
  @brands = Brand.all
  erb:brands
end

get('/stores') do
  @stores = Store.all
  erb:stores
end

get('/store/:id') do
  @store = Store.find(params['id'])
  erb:storeinfo
end

get('/brand/:id') do
  @brand = Brand.find(params['id'])
  erb:brandinfo
end

post('/stores') do
  store = Store.create({:store_name => params['store_name'], :id => nil})
  @stores = Store.all
  erb:stores
end

post('/brands') do
  brand = Brand.create({:brand_name => params['brand_name'], :price => params['price'], :id => nil})
  @brands = Brand.all
  erb:brands
end

patch('/store/:id') do
  @store = Store.find(params['id'])
  @store.update({:store_name => params['store_name']})
  erb:storeinfo
end

delete('/store/:id') do
  store = Store.find(params['id'])
  store.delete
  @stores = Store.all
  erb:stores
end
