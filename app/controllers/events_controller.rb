class EventsController < ApplicationController
  before_action {@company = Company.find(params[:company_id])}

  def index
    @events = @company.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = @company.events.new
  end

  def create
    @event = @company.events.new(event_params)
    if @event.save
      redirect_to company_event_path(@company, @event)
    else
      render :new
    end
  end

  def edit
    @event = @company.events.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to company_event_path(@company, @event)
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to company_events_path(@company)
  end

  private

  def event_params
    params.require(:event).permit(:description)
  end

end
