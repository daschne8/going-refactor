Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth', to: "sessions#create_git"
  get '/githublogin', to: "sessions#authenticate"

  get '/login', to: 'sessions#new'

  delete 'signout', to: 'sessions#destroy', as: 'signout'
  #root to: 'sessions#new'

  root to: 'home#show'

  
  post '/goods/goods_data', to: 'goods#goods_data'
  resources :goods
  resources :establishments
  resources :occupants, only: [:new, :create, :destroy]



  #resources :shops
  # resources :goods, only: [:create,:destroy,:update]
  # resources :tags, only: [:destroy]
  # resources :establishments, only: [:show] do
  #   resources :occupants, only: [:show]
  # end
  # resources :establishments, only: [:show] do
  #   resources :goods, only: [:show, :edit]
  # end
  # resources :establishments, only: [:destroy]


  scope '/admin', module: 'admin' do
    resources :displays, only: [:index]
  end
  #
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end
