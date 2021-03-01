class SessionsController < ApplicationController

    def create
      session[:user_id] = User.from_omniauth(request.env["omniauth.auth"]).id
      redirect_to home_index_path
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to home_index_path
    end

  end