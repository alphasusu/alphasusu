class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
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
    
end
