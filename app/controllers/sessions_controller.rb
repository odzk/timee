class SessionsController < ApplicationController
before_action :not_logged_in_user, only: [:new , :create, :edit, :update]

  def new

  end
  
  
  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  # #   #該当するemail探す　→variableに入れる
  # #   #find_byでモデルとやりとり
  
  #   if user && user.authenticate(params[:session][:password])
  # #   #その"該当するemail"って、、
  # #   #ユーザーが存在する？
  # #   #パスワードあってる？
  # #   #sessionのパスと、DBのパスは同じ？
  # #   #(authenticate- モデルのhas_secure_passwordがあるから使える)
  # #   #つまり、フォームに入れた情報大丈夫？ってこと。
  
  
  #       log_in user
  # #         #　セッションヘルパーの、log_in(user)を使ってる
  # #         # ここで、いわゆる"ログインした"って状態になって。。
  
  
  
  #       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  #       redirect_to user
        
  #       # redirect_back_or user
  #     # else
  #       # message = "Account not activated."
  #       # message += "Check your email for the activation link."
  #       # flash[:warning] = message
  #       redirect_to root_url
  #     # end
  #   else
  #     # Create an error message.
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end
  

  def createfb
    user = User.find_by(email: params[:email].downcase)

      if user.present?

      if user.fb_id.empty?

        flash[:danger] = "The email address you use to login for Facebook is already registered in timee. Please sign in using regular email and password. If you still have problems logging in, contact admin support at support@web-mech.net"
        
        redirect_to "/login"

      end

      if user && user.authenticate(params[:pass])
    log_in user
    redirect_back_or root_url
      end

    else

      redirect_to "/signup"

    end
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])

          log_in user
          redirect_back_or root_url

    else

      flash.now[:danger] = 'メールアドレスかパスワードが間違っています。'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  
  # def remember
  #   #①　for rememberボックス　　トークンTO database
  #   #1. Create token  
  #   self.remember_token = User.new_token   
    
  #   #2. Check model/user.rb for (def User.new_token)
  #   #今、remember_token(action)を作った　←token(ランダム文字列)入れた
  #   #self使うのは、Userの情報だから
  
  #   #Mispelling Error
  #   #update_attribute(:remember_digest, User.digset(remember_token))
    
  #   update_attribute(:remember_digest, User.digest(remember_token))
  #   # ":remember_digest"(DBの中のカラム)　に、"User.digest(remember_token)"（暗号化されたランダム文字列）を入れる。
  #   # "attribute = カラム
  #   # digest - 暗号化
  #   # モデルで作った、self.digest(string)を使って暗号化
    
    
  # end
  
  
  
end

