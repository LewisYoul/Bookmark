require 'data_mapper'


class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :link, :through => Resource

end

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
