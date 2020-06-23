class Api::V1::UsersController < ApplicationController
    def create
        #read user parameters
        #create a new user with the parameters
        @user = User.new 
        @user.name = params[:name]
        @user.username = params[:username]
        @user.email = params[:email]
        @user.is_admin = params[:is_admin]
        @user.password = params[:password]
         if @user.valid?
            @user.save
            render :create, status: :created
         else
            render json: { errors: @user.errors},status: 422
         end  
    end



end
