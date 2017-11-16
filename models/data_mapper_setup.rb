require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require './models/link.rb'
require './models/tag.rb'
require './models/user.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
