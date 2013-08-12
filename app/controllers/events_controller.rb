class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @events = Event.all
    @most_recent_status = Event.most_recent_status
  end

  def create
    Event.create!(event_params)
    redirect_to events_path
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  private

  def event_params
    params[:event].permit(:source, :status) rescue {}
  end
end
