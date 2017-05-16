require "spec_helper"

describe("add brand path", {:type => :feature}) do
  it("allows user to add brands") do
    visit("/brands")
    fill_in("name", :with => "Tester")
    fill_in("price", :with => 25)
    click_button("Add Brand")
    expect(page).to have_content("Brand added successfully!")
  end
end

describe("update and delete brand path", {:type => :feature}) do
  it("allows the user to update and delete brands") do
    visit("/brands")
    fill_in("name", :with => "Tester")
    fill_in("price", :with => 25)
    click_button("Add Brand")
    click_on("Tester")
    fill_in("name", :with => "Tester2")
    click_button("Update Name")
    expect(page).to have_content("Tester2")
    fill_in("price", :with => 26)
    click_button("Update Price")
    expect(page).to have_content("$26.00")
    click_button("DELETE BRAND")
    expect(page).to have_content("You haven't added any brands yet.")
  end

  it ("allows the user to mass delete brands") do
    Brand.create(name: "converse", raw_price: 45, final_price: nil)
    Brand.create(name: "chucks", raw_price: 45, final_price: nil)
    visit("/brands")
    all("input[type='checkbox']").each{|box| box.set('true')}
    click_button("DELETE BRAND(S)")
    expect(page).to have_content("You haven't added any brands yet.")
  end
end

describe("add store to brand path", {:type => :feature}) do
  it("allows the user to add stores to a brand") do
    store = Store.create(name: "the shoe king")
    visit("/brands")
    fill_in("name", :with => "Tester")
    fill_in("price", :with => 25)
    click_button("Add Brand")
    click_on("Tester")
    click_on("here")
    page.check('store_ids[]')
    click_button("Add Store(s)")
    expect(page).to have_content("Here are the stores that sell this brand: The Shoe King")
  end
end
