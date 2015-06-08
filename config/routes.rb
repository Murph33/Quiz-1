Rails.application.routes.draw do

  root "welcome#home"

  resources :requests

  post "requests/:id" => "requests#done_toggle"

  post "/search" => "requests#search"

end
