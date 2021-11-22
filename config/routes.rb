# frozen_string_literal: true

Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'users#new'
    resources :events
    resources :users, only: %i[new create show destroy]
    resources :lists, only: %i[index create show]
    resources :tasks, only: %i[index create general toggle done]
    get '/login' => 'users#new'
    delete '/logout' => 'users#destroy'
    get '/app/' => 'lists#index'
    get '/tasks/general' => 'tasks#general'
    get '/tasks/done' => 'tasks#done'
    patch '/tasks/:id/toggle' => 'tasks#toggle'
  end

