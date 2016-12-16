require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/store')
require('./lib/brand')

#home route
get('/') do
  @brands = Brand.all #grabs all the brands and makes them available
  erb(:index)
end

#store - multiple
get('/stores') do
  @stores = Store.all #grabs all the stores and makes them available
  erb(:stores)
end

#store - single
get('/store/:id') do
  @stores = Store.find(params.fetch("id").to_i) #finding single store with that id
  @brands = @stores.brands
  @allbrands = Brand.all
  erb(:store_detail)
end

#create store
post('/stores') do
  new_name = params['store-name'] # [] are the same as .fetch but default nil or null
  new_address = params['address']
  new_rating = params['rating']
  new_brand = Brand.find(params['brand_id'].to_i)
  #creates a new store with the data it fetched above
  @stores = Store.new({:name => new_name, :address => new_address, :ratings => new_rating})
  if @stores.save
      #pushes new brand to the store you just created
      @stores.brands.push(new_brand)
      redirect "/stores"
  else
    erb(:errors)
  end
end

#update store     #!!!!! investigate destory all - need to save multiple brands
patch('/store/:id') do
  new_store_name = params["new-name"]
  new_store_address = params["new-address"]
  new_store_rating = params['new-rating']
  #finds the store that matches the id
  @store = Store.find(params['id'].to_i)
  #update the store with the data fetched above
  @store.update({:name => new_store_name, :address => new_store_address, :ratings => new_store_rating})
  # #Destroy all brands associated with store
  # @store.brands.destroy_all
  #pushes new brand based on the id that was fetched above to the store
  @store.brands.push(Brand.find(params['brand_id']))
  redirect '/stores'
end

#delete store
delete('/store/:id') do
  Store.find(params['id'].to_i).destroy
  redirect '/stores'
end






#create brand
post('/brands') do
  new_brand = params['brand']
  #create a new brand with the value in the form and namt it @brand
  @brand = Brand.new({:name => new_brand})
  if @brand.save
    redirect "/"
  else
    erb(:errors2)
  end
end

#brands - multiple
get('/brands') do
  #get all your brands
  @brands = Brand.all
  erb(:brands)
end

#brands - single
get('/brands/:id') do
  #find the specific brand by id
  @brands = Brand.find(params['id'].to_i)
  erb(:brand)
end

#update brand
patch('/brands/:id') do
  #grab the new brand name
  new_brand = params['new_brand']
  #find the brand with the id
  @brands = Brand.find(params['id'].to_i)
  #update that found brand with the new brand
  @brands.update({:name => new_brand})
  @brands = Brand.all
  erb(:brands)
end

#delete brand
delete('/brands/:id') do
  Brand.find(params['id'].to_i).destroy
  redirect '/brands'
end
