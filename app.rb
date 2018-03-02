require("sinatra")
require("sinatra/reloader")
require ("active_record")
require ("sinatra/activerecord")
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
  @brands = Brand.all
  @storebrands = @store.brands
  erb:storeinfo
end

get('/brand/:id') do
  @brand = Brand.find(params['id'])
  erb:brandinfo
end

post('/stores') do
  store = Store.create({:store_name => params['store_name'], :id => nil})
  if !store.save()
    @error_message = "Make sure the store name is unique and under 100 characters long."
  end
  @stores = Store.all
  erb:stores
end

post('/brands') do
  brand = Brand.create({:brand_name => params['brand_name'], :price => params['price'], :id => nil})
  if !brand.save()
    @error_message = "Make sure the store name is unique and under 100 characters long, and price is present."
  end
  @brands = Brand.all
  erb:brands
end

post("/store/:id/brand") do
  brand = Brand.find(params['brand_id'])
  @store = Store.find(params['id'])
  @store.brands.push(brand)
  @storebrands = @store.brands
  @brands = Brand.all
  erb:storeinfo
end

patch('/store/:id') do
  @store = Store.find(params['id'])
  @store.update({:store_name => params['store_name']})
  @storebrands = @store.brands
  @brands = Brand.all
  erb:storeinfo
end

delete('/store/:id') do
  store = Store.find(params['id'])
  store.delete
  @stores = Store.all
  erb:stores
end
