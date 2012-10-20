Nopaste::Application.routes.draw do
  resources :pastes 

  root :to => "pastes#index"

end
