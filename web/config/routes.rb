Web::Application.routes.draw do

  get "/" => "the99_names#index"

  get "/names" => "names#index"

  get "/names/:id" => "names#show"

  get "/names/:id/edit" => "names#edit"

  get "/admin" => "admin#index"

  post "/admin" => "admin#log_in"
end
