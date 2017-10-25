class UsersController < ApplicationController

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

  end

  def event
    EventUser.create(event_id: params[:id], user_id: session[:user_id])
    @user = User.find_by(id: session[:user_id])
    redirect_to user_path(@user)
  end

  private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation, :image, :remove_image)
    end

end
