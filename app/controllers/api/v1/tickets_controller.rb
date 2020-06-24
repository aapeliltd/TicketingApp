class Api::V1::TicketsController < ApplicationController
    before_action :authenticate
    def index
        @tickets = Ticket.all.order(created_at: :desc)
        render :index, status: :ok
    end
    def create
            @ticket = Ticket.new 
            @ticket.title = params[:title]
            @ticket.body = params[:body]
            @ticket.user_id = @user.id
    
            if(@ticket.valid?)
                @ticket.save
                render :create, status: :created
            else
                render :error, status: 422
            end
    end
    #close ticket
    def close
        @ticket = Ticket.find_by(id: params[:id])
        if @ticket
            @ticket.is_close = true
            if @ticket.save
                render :close, status: :ok
            else
                # render error message
                render_error_message
            end
        else
            # render error message
            render_error_message
        end
        
    end

    def get_user_tickets 
        @user = User.find_by(id: params[:id])
        if(@user) 
            @tickets = @user.tickets.order(created_at: :desc)
            render :user_tickets, status: :ok
        else
            render_error_message
        end
    end
    
end


