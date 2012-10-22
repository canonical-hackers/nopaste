Nopaste::Application.routes.draw do
  resources :pastes do
    member do
      get 'fork'
      get 'raw'
    end
  end

  root :to => "pastes#index"

end
