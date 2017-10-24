class VenuesController < ApplicationController

  before_action :set_venue, only: [:show]

  def show
  end

  private

    def set_venue
      @venue = Venue.find_by(id: params[:id])
    end

    def venue_params
      params.require(:venue).permit()
    end

end
