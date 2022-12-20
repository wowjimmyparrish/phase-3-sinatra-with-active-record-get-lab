class ApplicationController < Sinatra::Base
set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # look up bakery in database by id
    bakery = Bakery.find(params[:id])
    # send bakery back along with its baked goods as a JSON array
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    #look up baked goods by price in database
    baked_goods = BakedGood.order(price: :desc)
    # send info sorted by price in descending order
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.order(price: :desc).first
    baked_good.to_json
  end

end
