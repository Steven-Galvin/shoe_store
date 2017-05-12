require "spec_helper"

describe Brand do
  it { should have_and_belong_to_many(:stores) }

  it "checks for the presence of brand name" do
    brand = Brand.new(name:  "")
    expect(brand.save).to(eq(false))
  end

  it "capitalizes names before creatings" do
    brand = Brand.create(name: "converse")
    expect(brand.name).to(eq("Converse"))
  end

  it "converts inputted cost into USD format" do
    brand = Brand.create(name: "converse", price: 45)
    expect(brand.currency_converter(brand.price)).to(eq("45.00"))
  end
end

describe Store do
  it { should have_and_belong_to_many(:brands) }

  it "checks for the presence of store name" do
    store = Store.new(name:  "")
    expect(store.save).to(eq(false))
  end

  it "capitalizes names before creatings" do
    store = Store.create(name: "the shoe king")
    expect(store.name).to(eq("The Shoe King"))
  end
end
