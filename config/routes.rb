AjostrowMe::Application.routes.draw do
 
  root to: 'Pages#about'
  match 'contact' => 'Pages#contact'
  match 'experience' => 'Pages#experience'
  
  resources :projects
  resources :thoughts
  resources :comments
  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
 
end
