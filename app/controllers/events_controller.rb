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

    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Event.where(date: start_date.beginning_of_month.beginning_of_day..start_date.end_of_month.end_of_day)
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end

end
