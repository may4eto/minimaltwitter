Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/twitter/callback', to: 'tweets#login'
  get "/", to: "tweets#index"
end
