require 'sinatra/base'

class BookmarkManager < Sinatra::Base


  enable :sessions

  get '/links' do
    erb(:links)
  end
end
