class ApplicationController < ActionController::Base

    def login!(user)
        user.reset_session_token!
        self.session[:session_token] = user.session_token
        user.session_token
    end
    
end
