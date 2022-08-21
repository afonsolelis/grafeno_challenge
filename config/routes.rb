# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#show'
  resources :transactions, only: %i[index show create]
  resources :print_with_guidelines, only: :index
end
