class Api::V1::AuthenticationController < ApplicationController
    def login
        # look up for the user in the database
        @user = User.find_by(username: params[:username])

        # check if user exist
        if(!@user)
            @message = "Invalid username"
            render :error, status: :unauthorized
        else
            if(@user.authenticate(params[:password]))
                secret_key = Rails.application.secrets.secret_key_base
                @token = JWT.encode({
                    id: @user.id,
                    username: @user.username
                }, secret_key)
                render :ok_user, status: :ok
            else
                @message = "Invalid username/password combination"
                render :error, status: :unauthorized 
            end
        end
    end
end
