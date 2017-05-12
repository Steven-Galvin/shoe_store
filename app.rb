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

get "/stores/:id" do
  id = params.fetch("id").to_i
  @store = Store.find(id)
  erb :store
end

# BRAND PATH

get "/brands" do

  erb :brands
end

get "/brands/:id" do

  erb :brand
end
