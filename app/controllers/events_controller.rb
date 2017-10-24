class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  def index
    @distance = (1..15).to_a
    @timing = ["This Week", "Next Week", "etc."]
  end

  def create
    # connect to EventBriteAdapter
    query = {
      search_keyword: event_params[:search_keyword],
      zipcode: event_params[:zipcode],
      radius: event_params[:radius],
      price: ( event_params[:free] == 1 ? "free" : "paid" ),
      start_date: event_params[:start_date].downcase.gsub(" ", "_")
    }
    search_results = EventBriteAdapter.new(query).create_event_objects
    session[:event_ids] = search_results.collect {|event| event.id }
    redirect_to search_results_path
  end

  def show
  end

  def search
    @matching_events = session[:event_ids].collect { |event_id| Event.find(id: event_id) }
  end

  private

    def set_event
      @event = Event.find_by(id: params[:id])
    end

    def event_params
      params.require(:event).permit(:search_keyword, :zipcode, :radius, :free, :start_date)
    end

end
