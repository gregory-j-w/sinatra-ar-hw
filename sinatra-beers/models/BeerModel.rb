class Beer < ActiveRecord::Base
  self.table_name = 'beers'
  has_many :beerstores, class_name: 'BeerStore'
  has_many :stores, through: :beerstores
end
