require "spec_helper"

describe("add store path", {:type => :feature}) do
  it("allows user to add store and takes user to store list page") do
    visit("/")
    fill_in("name", :with => "Tester")
    click_button("Add Store")
    expect(page).to have_content("Here are all the stores you've added:")
  end

  it("will display error message if user entered store doesn't meet requirements") do
    visit("/")
    fill_in("name", :with => "Test")
    click_button("Add Store")
    expect(page).to have_content("Please enter a name between 5 and 100 characters long.")
  end

  it("will display success message if user entered store meets requirement") do
    visit("/")
    fill_in("name", :with => "Tester")
    click_button("Add Store")
    fill_in("name", :with => "Test2")
    expect(page).to have_content("Store added successfully!")
  end
end

describe("update and delete store path", {:type => :feature}) do
  it("allows the user to update and delete stores") do
    visit("/")
    fill_in("name", :with => "Tester")
    click_button("Add Store")
    click_on("Tester")
    fill_in("name", :with => "Tester2")
    click_button("Update Store")
    expect(page).to have_content("Tester2")
    click_button("DELETE STORE")
    expect(page).to have_content("You haven't added any stores yet.")
  end

  it ("allows the user to mass delete stores") do
    store = Store.create(name: "the shoe king")
    store2 = Store.create(name: "steven's shoes")
    visit("/stores")
    all("input[type='checkbox']").each{|box| box.set('true')}
    click_button("DELETE STORE(S)")
    expect(page).to have_content("You haven't added any stores yet.")
  end
end

describe("add brand to store path", {:type => :feature}) do
  it("allows the user to add brands to a store") do
    brand = Brand.create(name: "converse", raw_price: 45, final_price: nil)
    visit("/stores")
    fill_in("name", :with => "Tester")
    click_button("Add Store")
    click_on("Tester")
    click_on("here")
    page.check('brand_ids[]')
    click_button("Add Brand(s)")
    expect(page).to have_content("Here are the brands this store sells: Converse")
  end
end
