require 'data_mapper'
require './app/app.rb'

task :test do
  puts "hello"
end

task :data_upgrade do
  DataMapper.auto_upgrade!
end

task :data_migrate do
  DataMapper.auto_migrate!
end
