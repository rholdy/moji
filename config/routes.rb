Moji::Application.routes.draw do
  root :to => "home#index"

  get "translate", to: "translate#new", as: :translate
  get "message/:id", to: "home#show", as: :show_message
  post "translate", to: "translate#create", as: :translate

end
