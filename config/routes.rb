Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home", as: :home
    get "/log-in", to: "sessions#new"
    post "/log-in", to: "sessions#create"
    delete "/log-out", to: "sessions#destroy"

    resources :subjects, only: %i(new create)
    resources :courses, only: %i(new create)
  end
end
