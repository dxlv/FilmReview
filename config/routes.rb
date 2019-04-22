Rails.application.routes.draw do
  devise_for :users
  # Create the routes to allow navigation in our application
  resources :films

  root 'films#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
