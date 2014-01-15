class EventsController < ApplicationController
  before_action :set_site_area
  load_and_authorize_resource

  def show
    @event = Event.friendly.find(params[:id])
  end
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(post_params)
    
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

private
  def post_params
    params.require(:event).permit(:title, :description, :date)
  end
  
  def set_site_area
    params[:site_area] = :events
  end
    
end
