class ApplicationController < ActionController::API
        # Enable sessions
        include ActionController::Cookies
        # make available
        helper_method 
        private
        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
end
