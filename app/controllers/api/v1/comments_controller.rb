class Api::V1::CommentsController < ApplicationController
    before_action :authenticate

    # get comments that belongs to this ticket Id
    def get_ticket_comments
        @ticket = Ticket.find_by(id: params[:id])
        if @ticket
            @user = User.find(@ticket.user_id)
            @comments = @ticket.comments
            render :ticket_comments, status: :ok
        else
            render_error_message
        end
    end


    # create comment on a ticket
    def create_comment
        @user = User.find_by(id: params[:user_id])
        is_admin = @user.is_admin ? true : false
        # check if the comments on the ticket is empty
        comments = Ticket.find(params[:id]).comments
        if comments.count == 0 && !is_admin
            # it means is only admin can comment for now
            @message = "You can not comment on this ticket at the moment"
            render :message, status: 422
        elsif comments.count == 0 && is_admin 
            # admin comment on this ticket for the first time.
            comment is_admin
        else
            # both customer and admin create comment here after all, admin must have commented on this ticket once.
            comment is_admin
        end

    end


    private 
    def comment is_admin
        @comment = Comment.new 
        @comment.body = params[:body]
        @comment.is_agent_comment = is_admin
        @comment.ticket_id = params[:id]
        @comment.user_id = params[:user_id]
        #byebug
        if @comment.valid?
            @comment.save
            render :create, status: :ok
        else
            render :error, status: 422
        end
    end
    
end
