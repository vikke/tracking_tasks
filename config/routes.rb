Rails.application.routes.draw do
  resources :task_masters
#  root 'home#index'
#  post '/', to: 'home#create'
#  patch '/:id', to: 'home#update'
  resources :home, only: [:create, :update, :index, :update]
  get '/', to: redirect('/home')

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  post 'tasks', to: 'tasks#create'

  resources :sessions, only: %i[create destroy]
end
