Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "currentprice", to: "currentprice#price"
  put "user/update/:id", to: "user#update"
  post "user", to: "user#create"
  post "user/show", to: "user#show"
  resources :transactions, only: [:index, :show, :create, :update]
end
