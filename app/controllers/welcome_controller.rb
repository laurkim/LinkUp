class WelcomeController < ApplicationController
  # before_action :require_logged_in

  def home
    render 'welcome/home', layout: false
  end
end
