class EventsController < ApplicationController

  before_action :set_event, only: [:show]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
  end

  private

    def set_event
      @event = Event.find_by(id: params[:id])
    end

    def event_params
      params.require(:event).permit()
    end

end
