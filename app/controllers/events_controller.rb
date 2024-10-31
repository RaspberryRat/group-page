class EventsController < ApplicationController
  before_action :authorized_organizer, except: [:index, :show]
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
    @events = Event.future

    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Event.where(date: start_date.beginning_of_month.beginning_of_day..start_date.end_of_month.end_of_day)
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
      redirect_to @event, notice: 'Event successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path, notice: 'Event successfully deleted'
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :date)
  end

  def authorized_organizer
    redirect_to root_path, status: :forbidden unless current_user.admin? || current_user.organizer?
  end
end
