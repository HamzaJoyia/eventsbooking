class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_event, only: [:show, :edit, :update, :destroy]
  
    # Cache the events list to improve performance
    def index
      @events = Rails.cache.fetch('events', expires_in: 5.minutes) { Event.all }
    end
  
    def show
      @ticket = Ticket.new
    end
  
    def new
      @event = current_user.events.build
    end
  
    def create
      @event = current_user.events.build(event_params)
  
      if @event.save
        redirect_to @event, notice: 'Event created successfully.'
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      if @event.update(event_params)
        redirect_to @event, notice: 'Event updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @event.destroy
      redirect_to events_path, notice: 'Event deleted successfully.'
    end
  
    private
  
    def set_event
      @event = Event.find(params[:id])
    end
  
    def event_params
      params.require(:event).permit(:name, :description, :location, :date, :tickets_total)
    end
  end
  
