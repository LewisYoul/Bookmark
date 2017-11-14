require 'sinatra/base'
require_relative '../models/link.rb'

class BookmarkManager < Sinatra::Base


  enable :sessions

  get '/' do
    'Hello'
  end

  get '/links' do
    @app_links = Link.all
     erb(:links)
  end

  post '/links' do
    Link.create(title: params[:Title], url: params[:URL])
    redirect '/links'
  end

  get '/links/new' do
    erb(:new)
  end
end
