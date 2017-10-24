class EventsController < ApplicationController

  before_action :set_event, only: [:show]
  def index
    @events = Event.new
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

  def search
    binding.pry
    event_params = { search_keyword: "halloween", zipcode: 10016, radius: 4, price: "free", start_date: "this_week" }

  end

  private

    def set_event
      @event = Event.find_by(id: params[:id])
    end

    def event_params
      params.require(:event).permit()
    end

end
