require 'sinatra/base'
require_relative '../models/link.rb'

class BookmarkManager < Sinatra::Base


  enable :sessions

  get '/links' do
    'sbb'
      @app_links = Link.all
     erb(:links)
  end

  get '/links/new' do
    erb(:new)
  end
end
