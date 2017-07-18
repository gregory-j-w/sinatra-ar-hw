require 'bundler'
Bundler.require

require './models/BeerStoreModel'
require './models/BeerModel'
require './models/StoreModel'
require './models/UserModel'

require './controllers/BeerController'
require './controllers/StoreController'
require './controllers/UserController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'beerproject'
)

map('/beers'){run BeerController}
map('/stores'){run StoreController}
map('/users'){run UserController}
