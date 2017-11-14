require 'sinatra/base'

class BookmarkManager < Sinatra::Base


  enable :sessions

  get '/' do
    erb(:index)
  end
end
