Rails.application.routes.draw do
    root 'lists#index'
    get 'lists/index'
    resources :tasks
    resources :lists
end
