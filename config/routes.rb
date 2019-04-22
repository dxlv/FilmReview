Rails.application.routes.draw do
  # Create the routes to allow navigation in our application
  resources :films

  root 'films#index'

end
