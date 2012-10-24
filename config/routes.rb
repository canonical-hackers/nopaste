Nopaste::Application.routes.draw do
  devise_for :users

  resources :pastes do
    member do
      get 'fork'
      get 'raw'
    end
  end

  root :to => "pastes#index"

end
