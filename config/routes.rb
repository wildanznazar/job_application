Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :path_prefix => 'auth', path: 'users', controllers: { registrations: "registrations" }

  resources :home, only: :index

  get '/companies', to: 'home#companies', as: 'companies'
  get '/job_ad', to: 'home#job_ad', as: 'job_ad'
  get '/profile', to: 'home#profile', as: 'profile'
  get '/join', to: 'home#join', as: 'join'
  get '/browse_jobs', to: 'home#browse_jobs', as: 'browse_jobs'
  get '/list_company', to: 'home#list_company', as: 'list_company'
  get '/job_detail', to: 'home#job_detail', as: 'job_detail'
  get '/applicant', to: 'home#applicant', as: 'applicant'
  get '/apply_page', to: 'home#apply_page', as: 'apply_page'
  post '/apply', to: 'home#apply', as: 'apply'
  post '/contact', to: 'home#contact', as: 'contact'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
