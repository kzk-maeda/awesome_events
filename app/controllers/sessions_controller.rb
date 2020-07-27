class SessionsController < ApplicationController
    def create
        logger.info request.env["omniauth.auth"]
        user = User.find_or_create_from_auth_hash!(request.env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in'
    end

    def destroy
        reset_session
        redirect_to root_path, notice: 'Logged out'
    end
end
