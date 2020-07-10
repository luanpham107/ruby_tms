Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home", as: :home
    get "/log-in", to: "sessions#new"
    post "/log-in", to: "sessions#create"
    delete "/log-out", to: "sessions#destroy"
    get "/search_user_by_name", to: "searchs#search_user_by_name"
    post "/add_existing_user_to_course", to: "user_courses#create"

    resources :subjects, only: %i(create new)
    resources :courses, except: %i(delete destroy)
    resources :user_courses, only: :create
  end
end
