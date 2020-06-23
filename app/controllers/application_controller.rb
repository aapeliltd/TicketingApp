class ApplicationController < ActionController::API
    def authenticate
        authorization_header = request.authorization
        if !authorization_header
            @message = "Unauthorized"
            render :message, status: :unauthorized
        else
            #byebug
            token = authorization_header.split(" ")[1]
           
            decoded_token = JWT.decode(token, ENV['SECRET_KEY'])
            #byebug
            @user = User.find(decoded_token[0]["id"])
        end
    end

    def generate_token(id, username)
        secret_key = ENV["SECRET_KEY"]
        @token = JWT.encode({
            id: id,
            username: username
        }, secret_key)
    end

    def render_error_message 
        @message = "Something went wrong, pls try again"
        render :message, status: :unprocessable_entity
    end
end
