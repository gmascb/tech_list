class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :validate_user
    
    def validate_user

        controllers = ["home", "sessions"]
        msg = "É necessário estar logado para usar o sistema."

        if current_user.nil?
            redirect_to root_path, notice: msg unless controllers.include?(request[:controller])
        end 
        
    end

    private 
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
