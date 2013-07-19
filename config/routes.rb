RailsProject::Application.routes.draw do
  root :to => 'static_pages#index'
  get "data" => 'static_pages#data'
  get "/update_location" => 'static_pages#location'
  resources :blahs
  get "/something_else/:id" => "blahs#blah"
end
