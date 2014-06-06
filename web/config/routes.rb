Web::Application.routes.draw do
  get "/" => "the99_names#index"

  get "/names" => "names#index"

  get "/names/:id" => "names#show"
end
