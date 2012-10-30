Nopaste::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login', :to => "devise/sessions#new"
    get 'forgot', :to => "devise/passwords#new"
    get 'logout', :to => "devise/sessions#destroy"
    get 'signup', :to => "devise/registrations#new"
    get 'profile', :to => "devise/registrations#edit"
    get 'resend', :to => "devise/confirmations#new"
  end

  resources :pastes do
    member do
      get 'fork'
      get 'raw'
    end
  end

  root :to => "pastes#index"

end
