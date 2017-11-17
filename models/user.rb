require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'bcrypt'
require_relative './password_attribute'

class User

  include DataMapper::Resource
  include PasswordAttribute

  property :id, Serial
  property :email, String
  property :password, String

end
