Nopaste::Application.routes.draw do
  resources :pastes do
    member do
      match 'fork' => 'pastes#fork'
    end
  end

  root :to => "pastes#index"

end
