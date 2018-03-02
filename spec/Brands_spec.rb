require 'spec_helper'

describe('Brand') do
  it("validates presence of brand name") do
    brand = Brand.new({:brand_name => ""})
    expect(brand.save()).to(eq(false))
  end

  it("validates presence of brand price") do
    brand = Brand.new({:price => ""})
    expect(brand.save()).to(eq(false))
  end

  it("validates length of brand name is less than 100 characters") do
    brand = Brand.new({:brand_name => "a".*(101)})
    expect(brand.save()).to(eq(false))
  end

  it("capitalizes the brand name") do
    brand = Brand.create({:brand_name => "some shoes", :price => "50"})
    expect(brand.brand_name()).to(eq("Some Shoes"))
  end

  it("corrects the brand price") do
    brand = Brand.create({:brand_name => "some shoes", :price => 50})
    expect(brand.price).to(eq(50.00))
  end
end
