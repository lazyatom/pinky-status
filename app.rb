require "rubygems"
require "bundler/setup"
require "sinatra"
require "data_mapper"

DataMapper::setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/pinky-status')

class Event
  include DataMapper::Resource
  property :id, Serial
  property :source, Enum[:manual, :twine], default: :twine
  property :status, Enum[:in, :out]
  property :created_at, DateTime

  def self.most_recent
    all(order: [:created_at.desc]).first
  end

  def self.most_recent_status
    most_recent ? most_recent.status : nil
  end

  def self.next_status
    if most_recent_status
      most_recent_status == :in ? :out : :in
    end
  end
end

DataMapper.finalize

Event.auto_upgrade!

get "/" do
  @events = Event.all
  @most_recent_status = Event.most_recent_status
  erb :index
end

post "/event" do
  Event.create!({created_at: Time.now, status: Event.next_status}.merge(params[:event] || {}))
  redirect "/"
end
