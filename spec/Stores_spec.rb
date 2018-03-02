require 'spec_helper'

describe('Store') do
  it("validates presence of store name") do
    store = Store.new({:store_name => ""})
    expect(store.save()).to(eq(false))
  end

  it("validates length of store name is less than 100 characters") do
    store = Store.new({:store_name => "a".*(101)})
    expect(store.save()).to(eq(false))
  end

  it("capitalizes the store name") do
    store = Store.create({:store_name => "a fake store"})
    expect(store.store_name()).to(eq("A Fake Store"))
  end

  it("tests for store name uniqueness") do
    store = Store.create({:store_name => "A Fake Store"})
    store2 = Store.new({:store_name => "A Fake Store"})
    expect(store.save()).to(eq(false))
  end
end
