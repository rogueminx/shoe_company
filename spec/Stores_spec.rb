require 'spec_helper'

describe('Store') do
  it("validates presence of store name") do
    store = Store.new({:store_name => ""})
    expect(store.save()).to(eq(false))
  end
end
