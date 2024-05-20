class EventsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :update, :edit, :destroy]

end
