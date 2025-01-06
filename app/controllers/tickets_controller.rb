class TicketsController < ApplicationController
    before_action :set_event
  
    def new
      @ticket = @event.tickets.build
    end
  
  
    def create
        @ticket = @event.tickets.build(ticket_params)
        @ticket.user = current_user
      
        tickets_available = @event.tickets_available || 0
      
        if tickets_available >= @ticket.quantity
          ActiveRecord::Base.transaction do
            if @ticket.save
              @event.decrement!(:tickets_available, @ticket.quantity) # Decrement available tickets after saving
            else
              raise ActiveRecord::Rollback # Rollback if ticket save fails
            end
          end
      
          redirect_to event_path(@event), notice: 'Tickets booked successfully!'
        else
          flash[:alert] = "Not enough tickets available."
          render :new
        end
      end
    
      private
    
      def set_event
        @event = Event.find(params[:event_id])
      end
    
      def ticket_params
        params.require(:ticket).permit(:quantity) 
      end
  end
  