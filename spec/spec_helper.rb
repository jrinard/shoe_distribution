ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('sinatra/activerecord')
require('./lib/store')
require('./lib/brand')

RSpec.configure do |config|
  # config.after(:each) do
  #   Store.all.each(&:destroy)
  #   Brand.all.each(&:destroy)
config.before(:each) do
    Store.destroy_all
    Brand.destroy_all
  end
end
