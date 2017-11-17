ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

helpers do
  def current_user
    @current_user ||= User.first(email: session[:email])
  end
end

  enable :sessions

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb(:signup)
  end

  post '/users' do
    # password = BCrypt::Password.create(params[:password])
    user = User.first_or_create(email: params[:email])
    user.password=(params[:password])
    user.save
    session[:email] = params[:email]
    redirect '/links'
  end

  get '/links' do
    @email = session[:email]
    @links = Link.all
     erb(:links)
  end

  post '/links' do
    link = Link.create(title: params[:Title], url: params[:URL])
    tags = params[:tag].split
    tags.each { |tag| link.tags << Tag.first_or_create(name: tag) }
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
