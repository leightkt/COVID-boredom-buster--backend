Rails.application.routes.draw do
  resources :favorites
  resources :activities
  resources :users
  get "/getActivity", to: "activities#get_activity"
  get "/userLogin", to: "users#login"
  get "/newFav", to: "favorites#newFav"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end