Rails.application.routes.draw do

#student request callback
get 'request/:id', to: 'users#request_call', as: 'request_call'
get 'request/delete/:id', to: 'users#delete_request', as: 'delete_request'
get 'accept/:id', to: 'users#accept_call', as: 'accept_call'
get 'decline', to: 'users#decline_call', as: 'decline_call'
get 'complete/:teacher_name/:student_name', to: 'users#mark_complete', as: 'mark_complete'


get 'student_class/:student', to: 'users#history_class', as: 'student_class'

get '/fb', to: 'users#createfb'
get '/fbpass', to: 'sessions#createfb', as: 'auto_sign'

get '/insta', to: 'users#createinsta'
get '/instapass', to: 'sessions#createinsta', as: 'auto_sign_insta'
get '/login_insta', to: 'users#login_insta'
get '/instaparams', to: 'users#instaparams', as: 'instaparams'

get 'debugpage', to: 'users#debugpage', as: 'debugpage'

resources :curriculums


get 'user/course/travel', to: 'curriculums#travel_english'
get 'user/course/idiomatic', to: 'curriculums#idiomatic_english'
get 'user/course/business', to: 'curriculums#business_english'
get 'user/course/daily', to: 'curriculums#daily_english'
get 'user/course/role_play', to: 'curriculums#role_playing'
get 'user/course/it', to: 'curriculums#it_english'

#status checker
get 'status_online', to: 'users#status_online', as: 'status_online'

#teacher report route
get 'report/:id', to: 'users#report_teacher', as: 'report_teacher'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'

get '/signupteacher', to: 'users#new2'
post '/signupteacher', to: 'users#create'
#signup

get '/contact_form', to: 'contact_form#new', as: 'new_message'
post '/contact_form', to: 'contact_form#create', as: 'create_message'

get '/login', to:'sessions#new'
post '/login', to:'sessions#create'
delete '/logout', to:'sessions#destroy'

get '/users/:id/endenter', to: 'users#endenter', as:'endenter_users'
get '/user/teacher', to: 'users#edit2', as:'edit2_user'

get '/user/new2', to: 'users#new2', as:'new2_user'
get '/user/new3', to: 'users#new3', as:'new3_user'

get '/user/salary', to: 'users#salary', as:'salary_user'


get '/purchase', to: 'users#edit3', as:'edit3_user'
get '/purchase10', to: 'users#edit4', as:'edit4_user'
get '/purchase60', to: 'users#edit5', as:'edit5_user'
get '/purchase180', to: 'users#edit6', as:'edit6_user'
get '/purchase600', to: 'users#edit7', as:'edit7_user'

get '/user/index2', to: 'users#index2', as:'index2_user'
get '/user/index3', to: 'users#index3', as:'index3_user'
get '/user/index4', to: 'users#index4', as:'index4_user'

get :search, controller: :search
get :check, controller: :search

post 'users/pay' => 'users#pay'

root 'static_pages#home'

resources :account_activations, only: [:edit]
resources :password_resets,     only: [:new, :create, :edit, :update]


#パスワード再設定
 
resources :users do
    collection do
      post 'purchase'
      post 'purchase2'
      post 'purchase3'
      post 'purchase4'
    end
  end


resources :history

get '/history/:id', to: 'history#show', as:'history_student'


resources :flows,     only: [:new, :create, :index]

resources :safes


get 'safe_before' => 'safes#safe'  
get 'safe_after' => 'safes#after'
get 'safes/:id/delete', to: 'safes#delete', as: 'delete_safes'

get '/analyze' => 'safes#analyze'  
get '/analyze2' => 'safes#analyze2'  


get 'slot_history' => 'safes#index1_2'  

get '/safes/:id/editing', to:'safes#edit2', as:'edit2_safes'


get 'zaiko' => 'safes#index2'  


end