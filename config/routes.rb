Rails.application.routes.draw do

  root "welcome#home"

  resources :requests

  post "requests/:id" => "requests#done_toggle"

  get "/search" => "requests#search"

end
