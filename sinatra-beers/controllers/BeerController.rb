class BeerController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    beers = Beer.all
    beers.to_json
  end

  get '/:id/:token' do
  response['Access-Control-Allow-Origin'] = '*'
  content_type :json
  id = params[:id]
  token = params[:token]
  user = User.find_by({token: token})
  if user
    beer = Beer.find(id)
    stores = beer.stores
    {beer: beer, stores: stores}.to_json
  else
    "ACCESS DENIED YOU MAY NOT PASS"
  end
end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    request_body = JSON.parse(request.body.read)
    beer = Beer.new(request_body)
    beer.save
    beer.to_json
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    beer = Beer.find(id)
    request_body = JSON.parse(request.body.read)
    beer.update_attributes(request_body)
    beer.save
    beer.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    beer = Beer.find(id)
    beer.destroy
    beers = Beer.all
    beers.to_json
  end
end
