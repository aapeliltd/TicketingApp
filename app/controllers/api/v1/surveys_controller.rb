class Api::V1::SurveysController < ApplicationController
    before_action :authenticate

    def create 
        @survey = Survey.new 
        @survey.comment = params[:comment]
        @survey.rating = params[:rating]
        @survey.ticket_id = params[:ticket_id]
        if(@survey.valid?)
            @survey.save
            # update ticket, since survey and ticket are one-to-one relationship
            @ticket = Ticket.find(params[:ticket_id])
            @ticket.survey_id = @survey.id
            @ticket.save
            render :create, status: :ok
        else
            render :error, status: 422
        end
    end
end
