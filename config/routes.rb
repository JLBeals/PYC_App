Rails.application.routes.draw do
  devise_for :users, :path_names => {
    :sign_in => 'login',
    :sign_out => 'logout',
    :controller=>'devise/sessions', :action=>'destroy'}

  resources :users
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  root 'simple_pages#landing_page'
  post 'simple_pages/thank_you'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
