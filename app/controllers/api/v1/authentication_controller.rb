class Api::V1::AuthenticationController < ApplicationController
    def login
        # look up for the user in the database
        @user = User.find_by(username: params[:username])

        # check if user exist
        if(!@user)
            @message = "Invalid username"
            render :error, status: :unprocessable_entity
        else
            if(@user.authenticate(params[:password]))
                render :ok_user, status: :ok
            else
                @message = "Invalid username/password combination"
                render :error, status: :unprocessable_entity 
            end
        end
    end
end
