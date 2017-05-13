require "spec_helper"

describe Brand do
  it { should have_and_belong_to_many(:stores) }

  it "checks for the presence of brand name" do
    brand = Brand.create(name: "", raw_price: 45, final_price: nil)
    expect(brand.save).to(eq(false))
  end

  it "checks for the presence of brand price" do
    brand = Brand.create(name: "converse", raw_price: nil, final_price: nil)
    expect(brand.save).to(eq(false))
  end

  it "checks for uniqueness of new brand" do
    brand = Brand.create(name: "converse", raw_price: 45, final_price: nil)
    brand2 = Brand.create(name: "converse", raw_price: 45, final_price: nil)
    expect(brand2.save).to(eq(false))
  end

  it "capitalizes names before creating" do
    brand = Brand.create(name: "converse", raw_price: 45, final_price: nil)
    expect(brand.name).to(eq("Converse"))
  end

  it "converts inputted cost into USD format" do
    brand = Brand.create(name: "converse", raw_price: 45.21, final_price: nil)
    expect(brand.final_price).to(eq("$45.21"))
  end

  it "doesn't save if characters exceed 100" do
    brand = Brand.create(name: "a".*(101))
    expect(brand.save).to(eq(false))
  end

  it "doesn't save if character are less than 5s" do
    brand = Brand.create(name: "a".*(4))
    expect(brand.save).to(eq(false))
  end
end

describe Store do
  it { should have_and_belong_to_many(:brands) }

  it "checks for the presence of store name" do
    store = Store.new(name:  "")
    expect(store.save).to(eq(false))
  end

  it "capitalizes names before creating" do
    store = Store.create(name: "the shoe king")
    expect(store.name).to(eq("The Shoe King"))
  end

  it "checks for uniqueness of new store" do
    store = Store.create(name: "the shoe king")
    store2 = Store.create(name: "the shoe king")
    expect(store2.save).to(eq(false))
  end

  it "doesn't save if characters exceed 100" do
    store = Store.create(name: "a".*(101))
    expect(store.save).to(eq(false))
  end

  it "doesn't save if character are less than 5s" do
    store = Store.create(name: "a".*(4))
    expect(store.save).to(eq(false))
  end
end
