Rails.application.routes.draw do
  resources :tasks
  resources :home, only: [:create, :update, :index, :update]
  get '/', to: redirect('/home')

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  post 'task_records', to: 'task_records#create'

  resources :sessions, only: %i[create destroy]
end
