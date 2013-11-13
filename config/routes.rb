Moji::Application.routes.draw do
  root :to => "home#new"

  get "message/:id", to: "home#show", as: :show_message
  post "translate", to: "home#create", as: :translate

end
