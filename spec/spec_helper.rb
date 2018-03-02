ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("brands")
require("stores")

RSpec.configure do |config|
  config.after(:each) do
    Brand.all().each() do |brands|
      brands.destroy()
    end
  end
    Store.all().each() do |stores|
      stores.destroy()
  end
end
