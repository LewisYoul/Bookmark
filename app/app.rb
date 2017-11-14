require 'sinatra/base'
require_relative '../models/link.rb'

class BookmarkManager < Sinatra::Base


  enable :sessions

  get '/links' do
    @app_links = Link.all
    erb(:links)
  end
end
