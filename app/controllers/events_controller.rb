class EventsController < ApplicationController
  before_action :set_events, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user  
    if !logged_in?
    flash[:danger] = "You must be logged in to perform that action"
    redirect_to login_path
    end
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:success] = "Event was succesfully created"
      redirect_to events_path
    else
      render 'new'
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Event was successfully updated"
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end
  
  def index
    @events = Event.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event was successfully deleted"
    redirect_to events_path
  end
  
  private
    def event_params
    params.require(:event).permit(:title, :description)
    end
end