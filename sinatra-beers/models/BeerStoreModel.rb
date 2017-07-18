class BeerStore < ActiveRecord::Base
  self.table_name = 'beer_stores'
  belongs_to :store
  belongs_to :beer
end
