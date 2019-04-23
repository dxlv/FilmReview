Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations", passwords: "passwords",}
  # Create the routes to allow navigation in our application
  resources :films do
    resources :reviews
  end

  root 'films#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
