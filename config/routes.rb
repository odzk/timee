Rails.application.routes.draw do


get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
#signup


get '/login', to:'sessions#new'
post '/login', to:'sessions#create'
delete '/logout', to:'sessions#destroy'

get '/users/:id/endenter', to: 'users#endenter', as:'endenter_users'
get '/user/teacher', to: 'users#edit2', as:'edit2_user'
get '/user/:id/edit3', to: 'users#edit3', as:'edit3_user'
get '/user/index2', to: 'users#index2', as:'index2_user'
get '/user/index3', to: 'users#index3', as:'index3_user'

get :search, controller: :search
get :check, controller: :search

post 'users/pay' => 'users#pay'

root 'static_pages#home'



# get '/sells/new', to: 'sells#new', as:'new_sells'
# post '/sells', to: 'sells#create'
# #sells_pathに飛ぶから更新できる。
# get '/sells/slot', to: 'sells#slot', as:'slot_sells'
# get '/sells/extra', to: 'sells#extra', as:'extra_sells'
# # SELLS の NEW (+create)

# get '/sells/:id/show', to: 'sells#show', as:'show_sells'
# # get '/sells/:id/show_slot/', to: 'sells#show_slot', as:'show_slot_sells'
# # get '/sells/:id/show_extra/', to: 'sells#show_extra', as:'show_extra_sells'
# # SELLS の SHOW

# get '/sells/:id/edit', to: 'sells#edit', as:'edit_sells'
# patch '/sells', to:'sells#update'
# put '/sells', to:'sells#update'
# get '/sells/:id/edit_slot/', to: 'sells#edit_slot', as:'edit_slot_sells'
# get '/sells/:id/edit_extra/', to: 'sells#edit_extra', as:'edit_extra_sells'
# # SELLS の EDIT

# post '/back' => "sells#back"
# get '/back', to: 'sells#back', as:'back_sells'
# # 前のページに戻るアクション

# get '/analyze', to: 'static_pages#analyze', as:'analyze_static_pages'
# # アナライズ


# get '/bss/:id/', to:'static_pages#edit', as:'edit'
# get '/bss/', to:'static_pages#index', as:'index'
# # admin:入金アクション

resources :account_activations, only: [:edit]
resources :password_resets,     only: [:new, :create, :edit, :update]
#パスワード再設定
 
resources :users


resources :safes  do
    collection do
      get 'csv_output'
      get 'csv_output_two'
      get 'csv_output_three'
      get 'csv_output_four'
      get 'csv_output_five'
      get 'csv_output_six'
      get 'csv_output_seven'
      get 'csv_output_n'
      get 'csv_output_two_n'
      get 'csv_output_three_n'
      get 'csv_output_four_n'
      get 'csv_output_five_n'
      get 'csv_output_six_n'
      get 'csv_output_seven_n'
      get 'newclear'
    end
  end


get 'safe_before' => 'safes#safe'  
get 'safe_after' => 'safes#after'  

get '/analyze' => 'safes#analyze'  
get '/analyze2' => 'safes#analyze2'  


get 'slot_history' => 'safes#index1_2'  

# get 'editing' => 'safes#edit2'  
get '/safes/:id/editing', to:'safes#edit2', as:'edit2_safes'


get 'zaiko' => 'safes#index2'  


end