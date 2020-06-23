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
            # try and log the user in
            @token = generate_token(@user.id, @user.username)
            if @user.authenticate(params[:password])
                render :create, status: :created
            end
            
         else
            render json: { errors: @user.errors},status: 422
         end  
    end




end
