ENV['RACK_ENV'] = 'test'
require 'rspec' 
require 'pry'
require 'pg'
require 'Brands'
require 'Stores'

RSpec.configure do |config|
  config.after(:each) do
    Brands.all().each() do |brands|
      brands.destroy()
    end
  end
    Stores.all().each() do |stores|
      stores.destroy()
    end
  end
end
