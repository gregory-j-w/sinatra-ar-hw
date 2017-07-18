class StoreController < Sinatra::Base
  get '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    Store.all.to_json
  end

  get '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    store = Store.find(id)
    store = store.beers
    {store: store, beer: beer}.to_json
  end

  post '/' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    store_props = JSON.parse(request.body.read)
    store = Store.new(store_props)
    store.save
    store.to_json
  end

  patch '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    store = Store.find(id)
    store_props = JSON.parse(request.body.read)
    store.update_attributes(store_props)
    store.save
    store.to_json
  end

  delete '/:id' do
    response['Access-Control-Allow-Origin'] = '*'
    content_type :json
    id = params[:id]
    store = Store.find(id)
    store.destroy
    Store.all.to_json
  end
end
