require_relative 'gossip'
require_relative 'comment'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end
  
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    erb :gossip, locals: {gossip:Gossip.find(params['id'].to_i), id:params['id'], comments:Comment.all(params['id'].to_i) }
  end
  
  get '/gossips/:id/edit/' do
    erb :edit, locals:  {gossip: Gossip.find(params['id'].to_i), id:params['id']} 
  end
  
  post '/gossips/:id/edit/' do
    Gossip.update(params["id"].to_i, params["gossip_author"], params["gossip_content"])
    redirect '/'
  end

  get '/gossips/:id/comment/' do
    erb :comment, locals:  {gossip: Gossip.find(params['id'].to_i), id:params['id']} 
  end
  
  post '/gossips/:id/comment/' do
    Comment.new(params["id"].to_i, params["comment_author"], params["comment_content"]).save
    redirect '/'
  end
end
