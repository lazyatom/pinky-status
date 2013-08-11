require "rubygems"
require "bundler/setup"
require "sinatra"
require "data_mapper"

DataMapper::setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/pinky-status')

class Event
  include DataMapper::Resource
  property :id, Serial
  property :created_at, DateTime
end

DataMapper.finalize

Event.auto_upgrade!

get "/" do
  @events = Event.all
  erb :index
end

post "/event" do
  Event.create!(created_at: Time.now)
end
