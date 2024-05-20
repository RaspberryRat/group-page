class EventsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: 'Event successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end

end
