Rails.application.routes.draw do
  get '/' =>"search#top"

  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/login" => "users#login_form"
  post "users/login" => "users#login"
  get "users/logout" => "users#logout"
  get "users/:id" => "users#mypage"
  #本当にgetでいいのか？？
  #https://teratail.com/questions/312381
  

  post "lessons/index" => "lessons#index"
  get "lessons/add" => "lessons#add"
  post "lessons/create" => "lessons#create"
  # post "lessons/search" =>"lessons#search"
  get "lessons/:id/edit" =>"lessons#edit"
  post "lessons/:id/update" => "lessons#update"
  get "lessons/:id/destroy" => "lessons#destroy"
  get "lessons/:id" => "lessons#show"
  

  
  get "mylessons/:id/register" => "mylessons#register"
  get "mylessons/:id/unregister" => "mylessons#unregister"
  get "mylessons/:id/unregister/frommypage" => "mylessons#unregister_frommypage"
  #本当にgetでいいのか？？
  

  get "corrects/:id/create" => "corrects#create"
  #本当にgetでいいのか？？



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
