class TweetsController < ApplicationController
    def index 
        if session[:token].present?
            client = Twitter::REST::Client.new do |config|
                config.consumer_key = Rails.application.credentials.dig(:twitter,:api_key)
                config.consumer_secret = Rails.application.credentials.dig(:twitter,:api_secret)
                config.access_token = session[:token]
                config.access_token_secret = session[:token_secret]
            end
            @tweets = client.home_timeline
        end
    end
    def login
        @response = request.env['omniauth.auth']
        session[:username] = @response[:info][:nickname]
        session[:token] = @response[:credentials][:token]
        session[:token_secret] = @response[:credentials][:secret]
        redirect_to "/"
    end
    def logout
        reset_session
        redirect_to "/"
    end
end
