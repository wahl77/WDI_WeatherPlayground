RailsProject::Application.routes.draw do
  root :to => 'static_pages#index'
  get "data" => 'static_pages#data'
  get "/update_location" => 'static_pages#location'
  resources :csvs
  get "/something_else/:id" => "csvs#blah"
end
