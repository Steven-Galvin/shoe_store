require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

# STORE PATH

get "/stores" do
  @stores = Store.all
  erb :stores
end

get "/stores/:id" do
  id = params.fetch("id").to_i
  @store = Store.find(id)
  erb :store
end

post "/stores" do
  @stores = Store.all
  name = params.fetch("name")
  store = Store.new(:name => name)
  if store.save
    @message = "Store added successfully!"
  else
    @message = "Please enter a name between 5 and 25 characters long."
  end
  erb :stores
end

get "/stores/:id/add_brands" do
  id = params.fetch("id").to_i
  @store = Store.find(id)
  @brands = Brand.all
  erb :add_brands_to_store
end

patch "/stores/:id" do
  name = params.fetch("name")
  id = params.fetch("id").to_i
  @store = Store.find(id)
  if @store.update({:name => name})
    @message = "Store updated successfully!"
  else
    @message = "Please enter a name between 5 and 25 characters long."
    @store.update({:name => "#{@store.name}"})
  end
  redirect "/stores/#{id}"
end

patch "/stores/:id/brands" do
  store_id = params['id'].to_i
  @store = Store.find(store_id)
  current_ids = @store.brands.map(&:id)
  brand_ids = params['brand_ids']
  all_brands = current_ids + brand_ids
  @store.update({:brand_ids => all_brands})
  redirect "/stores/#{store_id}"
end

delete "/stores/delete" do
  id = params.fetch("store_id")
  Store.where(id: id).destroy_all
  redirect "/stores"
end

delete "/stores/:id" do
  id = params.fetch("id").to_i
  @store = Store.find(id)
  @store.delete
  redirect "/stores"
end

# BRAND PATH

get "/brands" do
  @brands = Brand.all
  erb :brands
end

get "/brands/:id" do
  id = params.fetch("id").to_i
  @brand = Brand.find(id)
  erb :brand
end

post "/brands" do
  @brands = Brand.all
  name = params.fetch("name")
  price = params.fetch("price")
  brand = Brand.new(:name => name, :raw_price => price)
  if brand.save
    @message = "Brand added successfully!"
  else
    @message = "Please enter a name between 5 and 15 characters long."
  end
  erb :brands
end

get "/brands/:id/add_stores" do
  id = params.fetch("id").to_i
  @brand = Brand.find(id)
  @stores = Store.all
  erb :add_stores_to_brand
end

patch "/brands/:id/update_name" do
  name = params.fetch("name")
  id = params.fetch("id").to_i
  @brand = Brand.find(id)
  if @brand.update({:name => name})
    @message = "Brand updated successfully!"
  else
    @message = "Please enter a name between 5 and 25 characters long."
    @brand.update({:name => "#{@brand.name}"})
  end
  redirect "/brands/#{id}"
end

patch "/brands/:id/update_price" do
  price = params.fetch("price")
  id = params.fetch("id").to_i
  @brand = Brand.find(id)
  if @brand.update({:raw_price => price})
    @message = "Brand updated successfully!"
  else
    @message = "Please enter a valid number"
    @brand.update({:raw_price => "#{@brand.raw_price}"})
  end
  redirect "/brands/#{id}"
end

patch "/brands/:id/stores" do
  brand_id = params['id'].to_i
  @brand = Brand.find(brand_id)
  current_ids = @brand.stores.map(&:id)
  store_ids = params['store_ids']
  all_stores = current_ids + store_ids
  @brand.update({:store_ids => all_stores})
  redirect "/brands/#{brand_id}"
end

delete "/brands/delete" do
  id = params.fetch("brand_id")
  Brand.where(id: id).destroy_all
  redirect "/brands"
end

delete "/brands/:id" do
  id = params.fetch("id").to_i
  @brand = Brand.find(id)
  @brand.delete
  redirect "/brands"
end
