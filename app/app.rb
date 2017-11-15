ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative '../models/link.rb'
require_relative '../models/tag.rb'


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
    link = Link.create(title: params[:Title], url: params[:URL])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:new)
  end
end
