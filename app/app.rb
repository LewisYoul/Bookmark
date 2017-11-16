ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './models/data_mapper_setup'
# require_relative '../models/link.rb'
# require_relative '../models/tag.rb'


class BookmarkManager < Sinatra::Base


  enable :sessions

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
     erb(:links)
  end

  post '/links' do
    link = Link.create(title: params[:Title], url: params[:URL])
    tags = params[:tag].split

    tags.each { |tag| link.tags << Tag.first_or_create(name: tag) }

    # tag = Tag.first_or_create(name: params[:tag])
    # link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:new)
  end

  get '/tags/:tag' do
    @links = Tag.first(name: params[:tag]).links
    erb(:links)
  end
end
