class UsersController < ApplicationController
  before_action :check_if_logged_in, only: [:show]
  before_action :set_user, only: [:show, :event]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to login_path
  end

  def show
    @events = @user.events.sort {|a,b| a.start_time <=> b.start_time }
  end

  def event
    EventUser.find_or_create_by(event_id: params[:event_id], user_id: session[:user_id])
    @user = User.find_by(id: session[:user_id])
    redirect_to user_path(@user)
  end

  def delete_association
    association = EventUser.find_by(user_id: params[:id], event_id: params[:event_id])
    association.destroy
    redirect_to user_path(params[:id])
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation, :image, :remove_image, :event_id)
    end

end
