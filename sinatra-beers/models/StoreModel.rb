class Store < ActiveRecord::Base
  self.table_name = 'stores'
  has_many :beerstores, class_name: 'BeerStore'
  has_many :beers, through: :beerstores
end
