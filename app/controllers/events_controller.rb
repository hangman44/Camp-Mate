class EventsController < ApplicationController
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.user = User.first
    if @event.save
      flash[:success] = "Event was succesfully created"
      redirect_to event_path(@event)
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