class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user 

    def login!(user)
        user.reset_session_token!
        self.session[:session_token] = user.session_token
        user.session_token
    end

    def logged_in?
        !!current_user
    end

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end
    
    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil 
    end

    def require_logged_in
        redirect_to cats_url unless logged_in?
    end

    def require_logged_out
        redirect_to users_url if logged_in?
    end
end
