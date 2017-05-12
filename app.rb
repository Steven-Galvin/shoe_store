require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get "/" do
  erb :index
end

# STORE PATH

get "/stores" do

  erb :stores
end

get "/stores/:id" do

  erb :store
end

# BRAND PATH

get "/brands" do

  erb :brands
end

get "/brands/:id" do
  
  erb :brand
end
