Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home", as: :home
    get "/log-in", to: "sessions#new"
    post "/log-in", to: "sessions#create"
    delete "/log-out", to: "sessions#destroy"
    get "/search_user_by_name", to: "searchs#search_user_by_name"
    post "/add_existing_user_to_course", to: "user_courses#create"
    get "/search_subject_by_name", to: "searchs#search_subject_by_name"
    post "/add_subject_by_name", to: "course_details#create"

    resources :subjects, except: %i(index destroy) do
        resources :tasks, only: %i(show edit update)
    end
    resources :courses, except: :destroy
    resources :user_courses, only: :create
  end
end
